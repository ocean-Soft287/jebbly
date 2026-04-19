part of '../jeebly_eat_imports.dart';

class CategoryModel extends Equatable {
  final int id;
  final String nameAr;
  final String nameEn;
  final String logo;
  final int serviceId;


  const CategoryModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.logo,
    required this.serviceId,

  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id'] ?? 0,
    nameAr: json['nameAr'] ?? '',
    nameEn: json['nameEn'] ?? '',
    logo: json['logo'] ?? '',
    serviceId: json['serviceId'] ?? 0,

  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'nameAr': nameAr,
    'nameEn': nameEn,
    'logo': logo,
    'serviceId': serviceId,

  };

  CategoryModel copyWith({
    String? nameAr,
    String? nameEn,
    String? logo,
    int? serviceId,
    List<int>? restaurantIds,
  }) =>
      CategoryModel(
        id: id,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        logo: logo ?? this.logo,
        serviceId: serviceId ?? this.serviceId,

      );

  @override
  List<Object?> get props => [id, nameAr, nameEn, logo, serviceId];
}