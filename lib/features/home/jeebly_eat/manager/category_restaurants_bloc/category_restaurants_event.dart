import 'package:equatable/equatable.dart';

abstract class CategoryRestaurantsEvent extends Equatable {
  const CategoryRestaurantsEvent();

  @override
  List<Object?> get props => [];
}

class GetRestaurantsByCategoryEvent extends CategoryRestaurantsEvent {
  final String categoryId;

  const GetRestaurantsByCategoryEvent(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}
