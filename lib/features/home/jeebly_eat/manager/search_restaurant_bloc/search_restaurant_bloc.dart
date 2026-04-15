import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/bloc/base_bloc.dart';
import '../../datasource/search_restaurant_data_source.dart';
import '../../model/search_restaurant_model.dart';
import 'search_restaurant_event.dart';

class SearchRestaurantBloc extends Bloc<SearchRestaurantEvent, BaseState<SearchRestaurantModel>> {
  final SearchRestaurantDataSource dataSource;

  SearchRestaurantBloc(this.dataSource) : super(const BaseState<SearchRestaurantModel>()) {
    on<PerformSearch>(_onPerformSearch);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onPerformSearch(PerformSearch event, Emitter<BaseState<SearchRestaurantModel>> emit) async {
    if (event.query.isEmpty) {
      emit(state.copyWith(status: Status.initial, items: []));
      return;
    }

    emit(state.copyWith(status: Status.loading));

    final result = await dataSource.getSearchRestaurants(name: event.query);

    result.fold(
      (failure) => emit(state.copyWith(status: Status.failure, failure: failure)),
      (restaurants) => emit(state.copyWith(status: Status.success, items: restaurants)),
    );
  }

  void _onClearSearch(ClearSearch event, Emitter<BaseState<SearchRestaurantModel>> emit) {
    emit(state.copyWith(status: Status.initial, items: []));
  }
}
