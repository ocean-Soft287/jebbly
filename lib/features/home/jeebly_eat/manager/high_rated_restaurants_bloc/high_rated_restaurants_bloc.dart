import 'package:jeebly_mobile/core/bloc/paginated_bloc/paginated_bloc.dart';
import 'package:jeebly_mobile/core/http/endpoints.dart';
import 'package:jeebly_mobile/core/params/pagination_params.dart';
import 'package:jeebly_mobile/core/http/generic_data_source.dart';
import '../../model/search_restaurant_model.dart';

class HighRatedRestaurantsBloc extends PaginatedBloc<SearchRestaurantModel> {
  final GenericDataSource _dataSource;

  HighRatedRestaurantsBloc({required GenericDataSource dataSource})
      : _dataSource = dataSource,
        super(
          fetchPage: (page, limit, query, params) => dataSource.fetchData<SearchRestaurantModel>(
            endpoint: Endpoints.highRatedRestaurants,
            paginationParams: PaginationParams(page: page, limit: limit),
            fromJson: (json) => SearchRestaurantModel.fromJson(json),
          ),
          cacheKeyBuilder: (_, __) => "high_rated_restaurants",
          pageSize: 10,
        );
}
