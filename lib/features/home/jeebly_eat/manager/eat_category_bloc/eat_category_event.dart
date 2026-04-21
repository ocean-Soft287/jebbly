part of '../../jeebly_eat_imports.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

class FetchCategories extends CategoryEvent {
  final int serviceId;

  const FetchCategories({required this.serviceId});

  @override
  List<Object?> get props => [serviceId];
}