import 'package:jeebly_mobile/core/http/either.dart';
import 'package:jeebly_mobile/core/http/endpoints.dart';
import 'package:jeebly_mobile/core/http/failure.dart';
import 'package:jeebly_mobile/core/http/generic_data_source.dart';
import '../model/category_rastaurants_model.dart';

abstract class CategoryRestaurantsDataSource {
  Future<Either<Failure, List<CategoryRestaurantsModel>>> getRestaurantsByCategory({required String categoryId});
}

class CategoryRestaurantsDataSourceImpl implements CategoryRestaurantsDataSource {
  final GenericDataSource _genericDataSource;

  CategoryRestaurantsDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, List<CategoryRestaurantsModel>>> getRestaurantsByCategory({
    required String categoryId,
  }) async {
    return await _genericDataSource.fetchData<CategoryRestaurantsModel>(
      endpoint: Endpoints.getRestaurantsByCategory(categoryId: categoryId),
      fromJson: CategoryRestaurantsModel.fromJson,
    );
  }
}
