part of '../jeebly_eat_imports.dart';

abstract class CategoryDataSource {
  Future<Either<Failure, List<CategoryModel>>> getCategories({required String serviceId});
}

class CategoryDataSourceImpl implements CategoryDataSource {
  final GenericDataSource _genericDataSource;

  CategoryDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories({
    required String serviceId,
  }) async {
    return await _genericDataSource.fetchData<CategoryModel>(
      endpoint: Endpoints.getCategories(id: serviceId),
      fromJson: CategoryModel.fromJson,
    );
  }
}