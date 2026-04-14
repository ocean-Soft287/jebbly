import 'package:equatable/equatable.dart';

abstract class RestaurantDetailsEvent extends Equatable {
  const RestaurantDetailsEvent();

  @override
  List<Object?> get props => [];
}

class FetchRestaurantDetails extends RestaurantDetailsEvent {
  final String restaurantId;

  const FetchRestaurantDetails({required this.restaurantId});

  @override
  List<Object?> get props => [restaurantId];
}