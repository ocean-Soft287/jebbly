import 'package:jeebly_mobile/core/http/either.dart';
import 'package:jeebly_mobile/core/http/endpoints.dart';
import 'package:jeebly_mobile/core/http/failure.dart';
import 'package:jeebly_mobile/core/http/generic_data_source.dart';

abstract interface class UpdateQuantityDataSource {
  Future<Either<Failure, void>> updateQuantity({
    required int productId,
    required int newQuantity,
  });

  Future<Either<Failure, void>> removeItem({
    required int restaurantId,
    required int productId,
  });
}

class UpdateQuantityDataSourceImpl implements UpdateQuantityDataSource {
  final GenericDataSource _genericDataSource;

  UpdateQuantityDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, void>> updateQuantity({
    required int productId,
    required int newQuantity,
  }) {
    return _genericDataSource.updateData<void>(
      endpoint: Endpoints.updateCartQuantity(productId: productId),
      data: {'productId': productId, 'newQuantity': newQuantity},
    );
  }

  @override
  Future<Either<Failure, void>> removeItem({
    required int restaurantId,
    required int productId,
  }) {
    return _genericDataSource.deleteData<void>(
      endpoint: Endpoints.removeCartItem(
        restaurantId: restaurantId,
        productId: productId,
      ),
    );
  }
}