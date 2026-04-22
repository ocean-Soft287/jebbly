import 'package:equatable/equatable.dart';

sealed class RestaurantCartEvent extends Equatable {
  const RestaurantCartEvent();

  @override
  List<Object?> get props => [];
}

class FetchRestaurantCart extends RestaurantCartEvent {
  final int restaurantId;
  const FetchRestaurantCart(this.restaurantId);

  @override
  List<Object?> get props => [restaurantId];
}

class RefreshRestaurantCart extends RestaurantCartEvent {
  const RefreshRestaurantCart();
}

class IncrementProductQty extends RestaurantCartEvent {
  final int productId;
  const IncrementProductQty(this.productId);

  @override
  List<Object?> get props => [productId];
}

class DecrementProductQty extends RestaurantCartEvent {
  final int productId;
  const DecrementProductQty(this.productId);

  @override
  List<Object?> get props => [productId];
}

class RemoveProductFromCart extends RestaurantCartEvent {
  final int productId;
  const RemoveProductFromCart(this.productId);

  @override
  List<Object?> get props => [productId];
}

class AddRecommendedProduct extends RestaurantCartEvent {
  final int productId;
  const AddRecommendedProduct(this.productId);

  @override
  List<Object?> get props => [productId];
}

class UpdateStoreNote extends RestaurantCartEvent {
  final String note;
  const UpdateStoreNote(this.note);

  @override
  List<Object?> get props => [note];
}