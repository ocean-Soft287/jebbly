import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/features/home/restaurants/manager/restaurant_details_bloc/restaurants_details_event.dart';

import '../../../../../core/bloc/base_bloc.dart';
import '../../data/data_sources/restaurants_details_data_source/restaurants_details_data_source.dart';
import '../../models/restaurants_details_model.dart';
class RestaurantDetailsBloc
    extends Bloc<RestaurantDetailsEvent, BaseState<RestaurantDetailsModel>> {
  final RestaurantDetailsDataSource _dataSource;

  RestaurantDetailsBloc(this._dataSource) : super(const BaseState()) {
    on<FetchRestaurantDetails>(_onFetchRestaurantDetails);
  }

  Future<void> _onFetchRestaurantDetails(
      FetchRestaurantDetails event,
      Emitter<BaseState<RestaurantDetailsModel>> emit,
      ) async {
    emit(state.copyWith(status: Status.loading));

    final result = await _dataSource.getRestaurantDetails(
      restaurantId: event.restaurantId,
    );

    result.fold(
          (failure) => emit(state.copyWith(
        status: Status.failure,
        errorMessage: failure.message,
      )),
          (model) => emit(state.copyWith(
        status: Status.success,
        items: [model],
      )),
    );
  }
}