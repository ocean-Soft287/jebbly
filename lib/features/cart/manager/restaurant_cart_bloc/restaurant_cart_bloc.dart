import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/base_bloc.dart';
import '../../datasource/restaurant_cart_data_source.dart';
import '../../models/cart_bill_model.dart';
import '../../models/general_cart_model.dart';
import 'restaurant_cart_event.dart';
import 'restaurant_cart_state.dart';

class RestaurantCartBloc extends Bloc<RestaurantCartEvent, RestaurantCartState> {
  final RestaurantCartDataSource _dataSource;
  int? _restaurantId;

  RestaurantCartBloc(this._dataSource) : super(RestaurantCartState.initial()) {
    on<FetchRestaurantCart>(_onFetch);
    on<RefreshRestaurantCart>(_onRefresh);
    on<IncrementProductQty>(_onIncrement);
    on<DecrementProductQty>(_onDecrement);
    on<RemoveProductFromCart>(_onRemove);
    on<AddRecommendedProduct>(_onAddRecommended);
    on<UpdateStoreNote>(_onUpdateNote);
  }

  Future<void> _onFetch(
      FetchRestaurantCart event,
      Emitter<RestaurantCartState> emit,
      ) async {
    _restaurantId = event.restaurantId;
    emit(state.copyWith(status: Status.loading, errorMessage: ''));
    await _loadAll(emit);
  }

  Future<void> _onRefresh(
      RefreshRestaurantCart event,
      Emitter<RestaurantCartState> emit,
      ) async {
    if (_restaurantId == null) return;
    await _loadAll(emit, keepCurrentData: true);
  }

  Future<void> _loadAll(
      Emitter<RestaurantCartState> emit, {
        bool keepCurrentData = false,
      }) async {
    if (_restaurantId == null) return;

    final results = await Future.wait([
      _dataSource.fetchRestaurantCart(_restaurantId!),
      _dataSource.fetchCartBill(_restaurantId!),
      _dataSource.fetchRecommendations(_restaurantId!),
    ]);

    final cartResult = results[0];
    final billResult = results[1];
    final recommendationsResult = results[2];

    // السلة أساسية — لو فشلت نرجع failure
    GeneralCartModel? restaurant;
    String? errorMessage;

    cartResult.fold(
          (failure) => errorMessage = failure.message,
          (data) => restaurant = data as GeneralCartModel,
    );

    if (restaurant == null && !keepCurrentData) {
      emit(state.copyWith(
        status: Status.failure,
        errorMessage: errorMessage ?? '',
      ));
      return;
    }

    // ✅ قيمة افتراضية محسوبة محليًا — تُستبدل فقط لو نجح طلب الفاتورة
    CartBillModel bill = _computeLocalBill(restaurant ?? state.restaurant);
    billResult.fold(
          (_) {},
          (data) => bill = data as CartBillModel,
    );

    // التوصيات — لو فشلت تبقى القيمة الحالية
    List<CartProductModel> recommendations = state.recommendations;
    recommendationsResult.fold(
          (_) {},
          (data) => recommendations = data as List<CartProductModel>,
    );

    emit(state.copyWith(
      status: Status.success,
      restaurant: restaurant ?? state.restaurant,
      bill: bill,
      recommendations: recommendations,
      errorMessage: '',
    ));
  }

  // حساب الفاتورة محليًا لو الـ endpoint مش متوفر
  CartBillModel _computeLocalBill(GeneralCartModel? restaurant) {
    if (restaurant == null) return CartBillModel.empty();
    final itemsPrice = restaurant.products
        .fold<double>(0, (sum, p) => sum + (p.price * p.quantity));
    return CartBillModel(
      itemsPrice: itemsPrice,
      deliveryFee: state.bill.deliveryFee,
      serviceFee: state.bill.serviceFee,
      isServiceFree: state.bill.isServiceFree,
    );
  }

  Future<void> _onIncrement(
      IncrementProductQty event,
      Emitter<RestaurantCartState> emit,
      ) async {
    final product = _findProduct(event.productId);
    if (product == null || _restaurantId == null) return;

    final newQty = product.quantity + 1;
    _updateQuantityOptimistic(emit, event.productId, newQty);

    final result = await _dataSource.updateItemQuantity(
      restaurantId: _restaurantId!,
      productId: event.productId,
      quantity: newQty,
    );

    result.fold(
          (failure) => _rollbackQuantity(emit, event.productId, product.quantity, failure.message),
          (_) {},
    );
  }

  Future<void> _onDecrement(
      DecrementProductQty event,
      Emitter<RestaurantCartState> emit,
      ) async {
    final product = _findProduct(event.productId);
    if (product == null || _restaurantId == null) return;

    // لو الكمية 1 والمستخدم ضغط ناقص → نحذف المنتج
    if (product.quantity <= 1) {
      add(RemoveProductFromCart(event.productId));
      return;
    }

    final newQty = product.quantity - 1;
    _updateQuantityOptimistic(emit, event.productId, newQty);

    final result = await _dataSource.updateItemQuantity(
      restaurantId: _restaurantId!,
      productId: event.productId,
      quantity: newQty,
    );

    result.fold(
          (failure) => _rollbackQuantity(emit, event.productId, product.quantity, failure.message),
          (_) {},
    );
  }

  Future<void> _onRemove(
      RemoveProductFromCart event,
      Emitter<RestaurantCartState> emit,
      ) async {
    if (state.restaurant == null || _restaurantId == null) return;

    final previous = state.restaurant!.products;
    final updated = previous
        .where((p) => p.productId != event.productId)
        .toList();

    final updatedRestaurant =
    state.restaurant!.copyWith(products: updated);

    emit(state.copyWith(
      restaurant: updatedRestaurant,
      bill: _computeLocalBill(updatedRestaurant),
    ));

    final result = await _dataSource.removeItem(
      restaurantId: _restaurantId!,
      productId: event.productId,
    );

    result.fold(
          (failure) {
        // rollback
        emit(state.copyWith(
          restaurant: state.restaurant!.copyWith(products: previous),
          bill: _computeLocalBill(
            state.restaurant!.copyWith(products: previous),
          ),
          status: Status.failure,
          errorMessage: failure.message,
        ));
      },
          (_) {},
    );
  }

  Future<void> _onAddRecommended(
      AddRecommendedProduct event,
      Emitter<RestaurantCartState> emit,
      ) async {
    if (_restaurantId == null) return;

    final result = await _dataSource.addItem(
      restaurantId: _restaurantId!,
      productId: event.productId,
      quantity: 1,
    );

    result.fold(
          (failure) => emit(state.copyWith(
        status: Status.failure,
        errorMessage: failure.message,
      )),
          (_) {
        // نعيد تحميل السلة لتعكس المنتج الجديد
        add(const RefreshRestaurantCart());
      },
    );
  }

  void _onUpdateNote(
      UpdateStoreNote event,
      Emitter<RestaurantCartState> emit,
      ) {
    emit(state.copyWith(storeNote: event.note));
  }

  // ===== Helpers =====

  CartProductModel? _findProduct(int productId) {
    return state.restaurant?.products
        .firstWhere((p) => p.productId == productId, orElse: () => _notFound);
  }

  static const _notFound = CartProductModel(
    productId: -1,
    price: 0,
    quantity: 0,
  );

  void _updateQuantityOptimistic(
      Emitter<RestaurantCartState> emit,
      int productId,
      int newQty,
      ) {
    if (state.restaurant == null) return;
    final updatedProducts = state.restaurant!.products.map((p) {
      if (p.productId == productId) return p.copyWith(quantity: newQty);
      return p;
    }).toList();

    final updatedRestaurant =
    state.restaurant!.copyWith(products: updatedProducts);

    emit(state.copyWith(
      restaurant: updatedRestaurant,
      bill: _computeLocalBill(updatedRestaurant),
    ));
  }

  void _rollbackQuantity(
      Emitter<RestaurantCartState> emit,
      int productId,
      int oldQty,
      String errorMessage,
      ) {
    _updateQuantityOptimistic(emit, productId, oldQty);
    emit(state.copyWith(
      status: Status.failure,
      errorMessage: errorMessage,
    ));
  }
}