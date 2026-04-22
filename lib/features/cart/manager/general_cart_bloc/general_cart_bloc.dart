import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base_bloc.dart';
import '../../datasource/general_cart_datasource.dart';
import '../../models/general_cart_model.dart';
import 'general_cart_event.dart';

class GeneralCartBloc extends Bloc<GeneralCartEvent, BaseState<GeneralCartModel>> {
  final GeneralCartDataSource _dataSource;

  GeneralCartBloc(this._dataSource)
      : super(const BaseState<GeneralCartModel>()) {
    on<FetchGeneralCart>(_onFetch);
    on<RefreshGeneralCart>(_onRefresh);
    on<RemoveRestaurantFromCart>(_onRemoveRestaurant);
  }

  Future<void> _onFetch(
      FetchGeneralCart event,
      Emitter<BaseState<GeneralCartModel>> emit,
      ) async {
    emit(state.copyWith(status: Status.loading, errorMessage: ''));
    final result = await _dataSource.fetchGeneralCart();
    result.fold(
          (failure) => emit(state.copyWith(
        status: Status.failure,
        errorMessage: failure.message,
      )),
          (data) => emit(state.copyWith(
        status: Status.success,
        items: data,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onRefresh(
      RefreshGeneralCart event,
      Emitter<BaseState<GeneralCartModel>> emit,
      ) async {
    // بدون loading عشان ما تختفيش البيانات الموجودة أثناء السحب للتحديث
    final result = await _dataSource.fetchGeneralCart();
    result.fold(
          (failure) => emit(state.copyWith(
        status: Status.failure,
        errorMessage: failure.message,
      )),
          (data) => emit(state.copyWith(
        status: Status.success,
        items: data,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onRemoveRestaurant(
      RemoveRestaurantFromCart event,
      Emitter<BaseState<GeneralCartModel>> emit,
      ) async {
    // Optimistic update — نحذف محليًا أولاً لتحسين UX
    final previous = List<GeneralCartModel>.from(state.items);
    final updated = previous
        .where((r) => r.restaurantId != event.restaurantId)
        .toList();

    emit(state.copyWith(items: updated, status: Status.success));

    final result = await _dataSource.removeRestaurantCart(event.restaurantId);
    result.fold(
          (failure) {
        // rollback لو فشل الطلب
        emit(state.copyWith(
          items: previous,
          status: Status.failure,
          errorMessage: failure.message,
        ));
      },
          (_) {
        // تم الحذف بنجاح — لا شيء للتعديل
      },
    );
  }
}