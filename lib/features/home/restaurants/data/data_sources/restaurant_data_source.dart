import 'package:jeebly_mobile/core/http/either.dart';
import 'package:jeebly_mobile/core/http/failure.dart';
import 'package:jeebly_mobile/core/http/generic_data_source.dart';
import 'package:jeebly_mobile/core/params/pagination_params.dart';
import 'package:jeebly_mobile/core/http/endpoints.dart';

import '../../models/product_model.dart';
import '../../models/restaurant_model.dart';

abstract interface class RestaurantDataSource {
  Future<Either<Failure, List<RestaurantModel>>> getAllRestaurants(PaginationParams params);
  Future<Either<Failure, List<ProductModel>>> getRestaurantProducts(
      {required int restaurantId, required int categoryId, required PaginationParams paginationParams});
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

  @override
  Future<Either<Failure, List<ProductModel>>> getRestaurantProducts(
      {required int restaurantId, required int categoryId, required PaginationParams paginationParams}) async {
    return _genericDataSource.fetchResult<List<ProductModel>>(
      endpoint: Endpoints.getProducts,
      queryParameters: {
        'restaurantId': restaurantId,
        'categoryId': categoryId,
        'pageNumber': paginationParams.page,
        'pageSize': paginationParams.limit ?? 10,
      },
      fromJson: (dynamic json) {
        final List<dynamic> listData;
        if (json is Map && json['data'] is List) {
          listData = json['data'] as List;
        } else if (json is List) {
          listData = json;
        } else if (json is Map && json['data']['data'] is List) {
          listData = json['data']['data'] as List;
        } else {
          listData = [];
        }
        return listData.map((e) => ProductModel.fromJson(e as Map<String, dynamic>)).toList();
      },
    );
  }
}
