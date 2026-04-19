import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import '../../datasource/category_restaurants_datasource.dart';
import '../../model/category_rastaurants_model.dart';
import 'category_restaurants_event.dart';

class CategoryRestaurantsBloc extends Bloc<CategoryRestaurantsEvent, BaseState<CategoryRestaurantsModel>> {
  final CategoryRestaurantsDataSource _categoryRestaurantsDataSource;

  CategoryRestaurantsBloc(this._categoryRestaurantsDataSource) : super(const BaseState<CategoryRestaurantsModel>()) {
    on<GetRestaurantsByCategoryEvent>(_onGetRestaurantsByCategory);
  }

  Future<void> _onGetRestaurantsByCategory(
    GetRestaurantsByCategoryEvent event,
    Emitter<BaseState<CategoryRestaurantsModel>> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _categoryRestaurantsDataSource.getRestaurantsByCategory(categoryId: event.categoryId);
    result.fold(
      (failure) => emit(state.copyWith(
        status: Status.failure,
        errorMessage: failure.message,
      )),
      (restaurants) => emit(state.copyWith(
        status: Status.success,
        items: restaurants,
      )),
    );
  }
}
