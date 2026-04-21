import 'package:jeebly_mobile/core/bloc/paginated_bloc/paginated_bloc.dart';
import 'package:jeebly_mobile/features/home/restaurants/data/data_sources/restaurant_data_source.dart';
import 'package:jeebly_mobile/features/home/restaurants/models/product_model.dart';

import '../../../../../core/params/pagination_params.dart';

class ProductBloc extends PaginatedBloc<ProductModel> {
  final RestaurantDataSource _restaurantDataSource;

  ProductBloc(this._restaurantDataSource)
      : super(
          fetchPage: (page, limit, query, params) async {
            return await _restaurantDataSource.getRestaurantProducts(
              restaurantId: params['restaurantId'],
              categoryId: params['categoryId'],
              paginationParams: PaginationParams(page: page, limit: limit),
            );
          },
          pageSize: 10,
          cacheKeyBuilder: (params, query) => 'products_${params['restaurantId']}_${params['categoryId']}',
        );
}
