import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/features/cart/datasource/data_sources/cart_datasource.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final String message;
  CartSuccess(this.message);
}

class CartFailure extends CartState {
  final String message;
  CartFailure(this.message);
}

class CartCubit extends Cubit<CartState> {
  final CartDataSource _cartDataSource;

  CartCubit(this._cartDataSource) : super(CartInitial());

  Future<void> addToCart({required int productId, required int quantity}) async {
    emit(CartLoading());
    final result = await _cartDataSource.addToCart(productId: productId, quantity: quantity);
    result.fold(
      (failure) => emit(CartFailure(failure.message)),
      (_) => emit(CartSuccess('Added to cart successfully')),
    );
  }
}
