import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part 'search_restaurant_model.g.dart';

@HiveType(typeId: 20)
class SearchRestaurantModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String nameAr;
  @HiveField(2)
  final String nameEn;
  @HiveField(3)
  final String logo;
  @HiveField(4)
  final double? rating;
  @HiveField(5)
  final int minDeliveryTime;
  @HiveField(6)
  final int maxDeliveryTime;
  @HiveField(7)
  final int averagePreparationTime;





  const SearchRestaurantModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.logo,
    this.rating,
    required this.minDeliveryTime,
    required this.maxDeliveryTime,
    required this.averagePreparationTime,
  });

  factory SearchRestaurantModel.fromJson(Map<String, dynamic> json) {
    return SearchRestaurantModel(
      id: json['id'] ??0,
      nameAr: json['nameAr'] ??'',
      nameEn: json['nameEn'] ??'',
      logo: json['logo'] ??'',
      rating: (json['rating'] ?? 0.0).toDouble(),
      minDeliveryTime: json['minDeliveryTime'] ??0,
      maxDeliveryTime: json['maxDeliveryTime'] ??0,
      averagePreparationTime: json['averagePreparationTime'] ??0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameAr': nameAr,
      'nameEn': nameEn,
      'logo': logo,
      'rating': rating,
      'minDeliveryTime': minDeliveryTime,
      'maxDeliveryTime': maxDeliveryTime,
      'averagePreparationTime': averagePreparationTime,
    };
  }

  factory SearchRestaurantModel.empty() {
    return const SearchRestaurantModel(
      id: 0,
      nameAr: '',
      nameEn: '',
      logo: '',
      rating: null,
      minDeliveryTime: 0,
      maxDeliveryTime: 0,
      averagePreparationTime: 0,
    );
  }

  @override
  List<Object?> get props => [
    id,
    nameAr,
    nameEn,
    logo,
    rating,
    minDeliveryTime,
    maxDeliveryTime,
    averagePreparationTime,
  ];
}
