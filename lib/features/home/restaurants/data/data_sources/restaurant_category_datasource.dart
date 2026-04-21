import 'package:jeebly_mobile/core/http/either.dart';
import 'package:jeebly_mobile/core/http/endpoints.dart';
import 'package:jeebly_mobile/core/http/failure.dart';
import 'package:jeebly_mobile/core/http/generic_data_source.dart';
import '../../models/restaurant_category_model.dart';

abstract class RestaurantCategoryDataSource {
  Future<Either<Failure, List<RestaurantCategoryModel>>> getRestaurantCategories({required int restaurantId});
}

class RestaurantCategoryDataSourceImpl implements RestaurantCategoryDataSource {
  final GenericDataSource _genericDataSource;

  RestaurantCategoryDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, List<RestaurantCategoryModel>>> getRestaurantCategories({
    required int restaurantId,
  }) async {
    return await _genericDataSource.fetchData<RestaurantCategoryModel>(
      endpoint: Endpoints.getRestaurantCategories(restaurantId: restaurantId),
      fromJson: RestaurantCategoryModel.fromJson,
    );
  }
}
