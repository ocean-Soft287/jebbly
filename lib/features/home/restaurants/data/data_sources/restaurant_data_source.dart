import 'package:jeebly_mobile/core/http/either.dart';
import 'package:jeebly_mobile/core/http/failure.dart';
import 'package:jeebly_mobile/core/http/generic_data_source.dart';
import 'package:jeebly_mobile/core/params/pagination_params.dart';
import 'package:jeebly_mobile/core/http/endpoints.dart';
import 'package:jeebly_mobile/features/home/restaurants/data/models/restaurant_model.dart';

abstract interface class RestaurantDataSource {
  Future<Either<Failure, List<RestaurantModel>>> getAllRestaurants(PaginationParams params);
}

class RestaurantDataSourceImpl implements RestaurantDataSource {
  final GenericDataSource _genericDataSource;

  RestaurantDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, List<RestaurantModel>>> getAllRestaurants(PaginationParams params) async {
    return _genericDataSource.fetchResult<List<RestaurantModel>>(
      endpoint: Endpoints.getAllRestaurants,
      params: params,
      fromJson: (json) {
        final listData = json['data'] as List;
        return listData.map((e) => RestaurantModel.fromJson(e)).toList();
      },
    );
  }
}
