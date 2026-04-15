import 'package:equatable/equatable.dart';

class SearchRestaurantModel extends Equatable {
  final int id;
  final String nameAr;
  final String nameEn;
  final String logo;
  final double? rating;
  final int minDeliveryTime;
  final int maxDeliveryTime;
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
      rating: json['rating'] ?? 0.0,
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
