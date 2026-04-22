import 'package:jeebly_mobile/core/http/either.dart';
import 'package:jeebly_mobile/core/http/failure.dart';
import 'package:jeebly_mobile/core/http/generic_data_source.dart';
import 'package:jeebly_mobile/core/http/endpoints.dart';

abstract interface class CartDataSource {
  Future<Either<Failure, void>> addToCart({required int productId, required int quantity});
}

class CartDataSourceImpl implements CartDataSource {
  final GenericDataSource _genericDataSource;

  CartDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, void>> addToCart({required int productId, required int quantity}) async {
    return _genericDataSource.postData<void>(
      endpoint: Endpoints.addToCart(productId: productId),
      queryParameters: {'Quantity': quantity},
    );
  }
}
