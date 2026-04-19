import 'package:equatable/equatable.dart';

class RestaurantCategoryModel extends Equatable {
  final int id;
  final String name;
  final String image;

  const RestaurantCategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory RestaurantCategoryModel.fromJson(Map<String, dynamic> json) {
    return RestaurantCategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  @override
  List<Object?> get props => [id, name, image];
}
