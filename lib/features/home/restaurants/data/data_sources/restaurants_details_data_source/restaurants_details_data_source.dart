
import 'package:jeebly_mobile/core/http/endpoints.dart';

import '../../../../../../core/http/either.dart';
import '../../../../../../core/http/failure.dart';
import '../../../../../../core/http/generic_data_source.dart';
import '../../../models/restaurants_details_model.dart';

abstract class RestaurantDetailsDataSource {
  Future<Either<Failure, RestaurantDetailsModel>> getRestaurantDetails({
    required String restaurantId,
  });
}

class RestaurantDetailsDataSourceImpl implements RestaurantDetailsDataSource {
  final GenericDataSource _genericDataSource;

  RestaurantDetailsDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, RestaurantDetailsModel>> getRestaurantDetails({
    required String restaurantId,
  }) async {
    final result = await _genericDataSource.fetchResult(
     endpoint:  Endpoints.getRestaurantDetails(restaurantId: restaurantId),
      fromJson: RestaurantDetailsModel.fromJson,
    );

    return result.fold(
          (failure) => Left(failure),
          (response) {
            return Right(response);
      },
    );
  }
}