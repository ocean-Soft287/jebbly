import 'package:jeebly_mobile/core/bloc/paginated_bloc/paginated_bloc.dart';
import 'package:jeebly_mobile/core/params/pagination_params.dart';
import 'package:jeebly_mobile/features/home/restaurants/data/data_sources/restaurant_data_source.dart';

import '../../models/restaurant_model.dart';

class RestaurantBloc extends PaginatedBloc<RestaurantModel> {
  final RestaurantDataSource _dataSource;
  RestaurantBloc({required RestaurantDataSource dataSource})
    : _dataSource = dataSource,
      super(
        fetchPage: (page, limit, query, params) =>
            dataSource.getAllRestaurants(
              PaginationParams(page: page, limit: limit),
            ),
        cacheKeyBuilder: (_, __) => "all_restaurants",
      );
}
