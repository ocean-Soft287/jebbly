import 'package:equatable/equatable.dart';

abstract class RestaurantCategoryEvent extends Equatable {
  const RestaurantCategoryEvent();

  @override
  List<Object?> get props => [];
}

class FetchRestaurantCategories extends RestaurantCategoryEvent {
  final String restaurantId;

  const FetchRestaurantCategories({required this.restaurantId});

  @override
  List<Object?> get props => [restaurantId];
}
