part of '../jeebly_eat_imports.dart';

class CategoryModel extends Equatable {
  final String nameAr;
  final String nameEn;
  final String logo;
  final int serviceId;
  final List<int>? restaurantIds;

  const CategoryModel({
    required this.nameAr,
    required this.nameEn,
    required this.logo,
    required this.serviceId,
    this.restaurantIds,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    nameAr: json['nameAr'] ?? '',
    nameEn: json['nameEn'] ?? '',
    logo: json['logo'] ?? '',
    serviceId: json['serviceId'] ?? 0,
    restaurantIds: json['restaurantIds'] != null
        ? List<int>.from(json['restaurantIds'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    'nameAr': nameAr,
    'nameEn': nameEn,
    'logo': logo,
    'serviceId': serviceId,
    'restaurantIds': restaurantIds,
  };

  CategoryModel copyWith({
    String? nameAr,
    String? nameEn,
    String? logo,
    int? serviceId,
    List<int>? restaurantIds,
  }) =>
      CategoryModel(
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        logo: logo ?? this.logo,
        serviceId: serviceId ?? this.serviceId,
        restaurantIds: restaurantIds ?? this.restaurantIds,
      );

  @override
  List<Object?> get props => [nameAr, nameEn, logo, serviceId, restaurantIds];
}