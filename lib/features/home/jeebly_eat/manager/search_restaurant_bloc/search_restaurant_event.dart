import 'package:equatable/equatable.dart';

abstract class SearchRestaurantEvent extends Equatable {
  const SearchRestaurantEvent();

  @override
  List<Object> get props => [];
}

class PerformSearch extends SearchRestaurantEvent {
  final String query;

  const PerformSearch(this.query);

  @override
  List<Object> get props => [query];
}

class ClearSearch extends SearchRestaurantEvent {}
