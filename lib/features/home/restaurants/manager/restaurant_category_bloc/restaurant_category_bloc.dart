import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import '../../data/data_sources/restaurant_category_datasource.dart';
import '../../models/restaurant_category_model.dart';
import 'restaurant_category_event.dart';

class RestaurantCategoryBloc extends Bloc<RestaurantCategoryEvent, BaseState<RestaurantCategoryModel>> {
  final RestaurantCategoryDataSource _dataSource;

  RestaurantCategoryBloc(this._dataSource) : super(const BaseState<RestaurantCategoryModel>()) {
    on<FetchRestaurantCategories>(_onFetchRestaurantCategories);
  }

  Future<void> _onFetchRestaurantCategories(
    FetchRestaurantCategories event,
    Emitter<BaseState<RestaurantCategoryModel>> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _dataSource.getRestaurantCategories(restaurantId: event.restaurantId);
    result.fold(
      (failure) => emit(state.copyWith(
        status: Status.failure,
        errorMessage: failure.message,
      )),
      (categories) => emit(state.copyWith(
        status: Status.success,
        items: categories,
      )),
    );
  }
}
