import 'package:equatable/equatable.dart';

sealed class GeneralCartEvent extends Equatable {
  const GeneralCartEvent();

  @override
  List<Object?> get props => [];
}

class FetchGeneralCart extends GeneralCartEvent {
  const FetchGeneralCart();
}

class RefreshGeneralCart extends GeneralCartEvent {
  const RefreshGeneralCart();
}

class RemoveRestaurantFromCart extends GeneralCartEvent {
  final int restaurantId;
  const RemoveRestaurantFromCart(this.restaurantId);

  @override
  List<Object?> get props => [restaurantId];
}