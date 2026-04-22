import 'package:jeebly_mobile/core/http/endpoints.dart';

import '../../../../core/http/either.dart';
import '../../../../core/http/failure.dart';
import '../../../../core/http/generic_data_source.dart';
import '../models/cart_bill_model.dart';
import '../models/general_cart_model.dart';

abstract class RestaurantCartDataSource {
  Future<Either<Failure, GeneralCartModel>> fetchRestaurantCart(int restaurantId);

  Future<Either<Failure, CartBillModel>> fetchCartBill(int restaurantId);

  Future<Either<Failure, List<CartProductModel>>> fetchRecommendations(
      int restaurantId,
      );

  Future<Either<Failure, bool>> updateItemQuantity({
    required int restaurantId,
    required int productId,
    required int quantity,
  });

  Future<Either<Failure, void>> removeItem({
    required int restaurantId,
    required int productId,
  });

  Future<Either<Failure, bool>> addItem({
    required int restaurantId,
    required int productId,
    int quantity = 1,
  });
}

class RestaurantCartDataSourceImpl implements RestaurantCartDataSource {
  final GenericDataSource _genericDataSource;

  RestaurantCartDataSourceImpl(this._genericDataSource);

  @override
  Future<Either<Failure, GeneralCartModel>> fetchRestaurantCart(
      int restaurantId,
      ) async {
    return await _genericDataSource.fetchResult<GeneralCartModel>(
      endpoint: Endpoints.restaurantCart(restaurantId: restaurantId),
      fromJson: GeneralCartModel.fromJson,
    );
  }

  @override
  Future<Either<Failure, CartBillModel>> fetchCartBill(int restaurantId) async {
    return await _genericDataSource.fetchResult<CartBillModel>(
      endpoint: Endpoints.cartBill(restaurantId: restaurantId),
      fromJson: CartBillModel.fromJson,
    );
  }

  @override
  Future<Either<Failure, List<CartProductModel>>> fetchRecommendations(
      int restaurantId,
      ) async {
    return await _genericDataSource.fetchData<CartProductModel>(
      endpoint: Endpoints.cartRecommendations(restaurantId: restaurantId),
      fromJson: CartProductModel.fromJson,
    );
  }

  @override
  Future<Either<Failure, bool>> updateItemQuantity({
    required int restaurantId,
    required int productId,
    required int quantity,
  }) async {
    return await _genericDataSource.updateData<bool>(
      endpoint: Endpoints.updateCartItem(restaurantId: restaurantId),
      data: {'productId': productId, 'quantity': quantity},
    );
  }

  @override
  Future<Either<Failure, void>> removeItem({
    required int restaurantId,
    required int productId,
  }) async {
    return await _genericDataSource.deleteData<void>(
      endpoint: Endpoints.removeCartItem(
        restaurantId: restaurantId,
        productId: productId,
      ),
    );
  }

  @override
  Future<Either<Failure, bool>> addItem({
    required int restaurantId,
    required int productId,
    int quantity = 1,
  }) async {
    return await _genericDataSource.postData<bool>(
      endpoint: Endpoints.addToCart(productId: productId),
      data: {'productId': productId, 'quantity': quantity},
    );
  }
}