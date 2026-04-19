import 'package:equatable/equatable.dart';

class CategoryRestaurantsModel extends Equatable {
  final int id;
  final String nameAr;
  final String nameEn;
  final String logo;
  final double? rating;
  final double? minDeliveryTime;
  final double? maxDeliveryTime;
  final double? averagePreparationTime;

  const CategoryRestaurantsModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.logo,
    this.rating,
    this.minDeliveryTime,
    this.maxDeliveryTime,
    this.averagePreparationTime,
  });

  factory CategoryRestaurantsModel.fromJson(Map<String, dynamic> json) {
    return CategoryRestaurantsModel(
      id: json['id'] ?? 0,
      nameAr: json['nameAr'] ?? '',
      nameEn: json['nameEn'] ?? '',
      logo: json['logo'] ?? '',
      rating: (json['rating'] as num?)?.toDouble(),
      minDeliveryTime: (json['minDeliveryTime'] as num?)?.toDouble(),
      maxDeliveryTime: (json['maxDeliveryTime'] as num?)?.toDouble(),
      averagePreparationTime: (json['averagePreparationTime'] as num?)?.toDouble(),
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
