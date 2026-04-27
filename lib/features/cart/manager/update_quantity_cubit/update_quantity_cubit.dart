import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/base_bloc.dart';
import '../../datasource/update_quantity_datasource.dart';

class UpdateQuantityCubit extends Cubit<BaseState<int>> {
  final UpdateQuantityDataSource _dataSource;

  UpdateQuantityCubit(this._dataSource) : super(const BaseState<int>());

  Future<void> increment({
    required int productId,
    required int currentQuantity,
  }) {
    return _update(
      productId: productId,
      newQuantity: currentQuantity + 1,
    );
  }

  Future<void> decrement({
    required int productId,
    required int currentQuantity,
    required int restaurantId,
  }) {
    if (currentQuantity <= 1) {
      return _remove(productId: productId, restaurantId: restaurantId);
    }
    return _update(
      productId: productId,
      newQuantity: currentQuantity - 1,
    );
  }

  Future<void> _update({
    required int productId,
    required int newQuantity,
  }) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _dataSource.updateQuantity(
      productId: productId,
      newQuantity: newQuantity,
    );
    result.fold(
      (failure) => emit(state.copyWith(
        status: Status.failure,
        failure: failure,
        errorMessage: failure.message,
      )),
      (_) => emit(state.copyWith(
        status: Status.success,
        data: newQuantity,
      )),
    );
  }

  Future<void> _remove({
    required int productId,
    required int restaurantId,
  }) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _dataSource.removeItem(
      productId: productId,
      restaurantId: restaurantId,
    );
    result.fold(
      (failure) => emit(state.copyWith(
        status: Status.failure,
        failure: failure,
        errorMessage: failure.message,
      )),
      (_) => emit(state.copyWith(
        status: Status.success,
        data: 0,
      )),
    );
  }
}