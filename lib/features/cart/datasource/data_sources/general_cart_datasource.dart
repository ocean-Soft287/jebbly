import 'package:jeebly_mobile/core/http/endpoints.dart';

import '../../../../core/http/either.dart';
import '../../../../core/http/failure.dart';
import '../../../../core/http/generic_data_source.dart';
import '../../models/general_cart_model.dart';

abstract class GeneralCartDataSource {
  Future<Either<Failure, List<GeneralCartModel>>> fetchGeneralCart();

  Future<Either<Failure, bool>> removeRestaurantCart(int restaurantId);
}

class GeneralCartDataSourceImpl implements GeneralCartDataSource {
  final GenericDataSource _genericDataSource;

  GeneralCartDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, List<GeneralCartModel>>> fetchGeneralCart() async {
    return await _genericDataSource.fetchData<GeneralCartModel>(
      endpoint: Endpoints.generalCart,
      fromJson: GeneralCartModel.fromJson,
    );
  }

  @override
  Future<Either<Failure, bool>> removeRestaurantCart(int restaurantId) async {
    return await _genericDataSource.deleteData<bool>(
      endpoint: Endpoints.removeGeneralCart(restaurantId: restaurantId),
    );
  }
}
