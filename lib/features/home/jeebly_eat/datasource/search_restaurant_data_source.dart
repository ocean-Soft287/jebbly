import 'package:jeebly_mobile/core/http/endpoints.dart';

import '../../../../core/http/either.dart';
import '../../../../core/http/failure.dart';
import '../../../../core/http/generic_data_source.dart';
import '../model/search_restaurant_model.dart';

abstract interface class SearchRestaurantDataSource {
  Future<Either<Failure, List<SearchRestaurantModel>>> getSearchRestaurants({required String name});
}


class SearchRestaurantDataSourceImpl implements SearchRestaurantDataSource {
  final GenericDataSource dataSource;
  SearchRestaurantDataSourceImpl(this.dataSource);
  @override
  Future<Either<Failure, List<SearchRestaurantModel>>> getSearchRestaurants({required String name}) {
    return dataSource.fetchData(endpoint: Endpoints.searchRestaurants, fromJson: SearchRestaurantModel.fromJson,
    queryParameters: {'name': name},
    );
  }}