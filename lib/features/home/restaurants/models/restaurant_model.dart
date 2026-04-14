import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part 'restaurant_model.g.dart';

@HiveType(typeId: 15)
class RestaurantModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int serviceId;
  @HiveField(2)
  final String? nameOfResturantAr;
  @HiveField(3)
  final String? nameOfResturantEn;
  @HiveField(4)
  final String? descriptionAr;
  @HiveField(5)
  final String? descriptionEn;
  @HiveField(6)
  final String? logo;
  @HiveField(7)
  final double rate;
  @HiveField(8)
  final String? nameOfResturantOwner;
  @HiveField(9)
  final String? areaOfResturantAr;
  @HiveField(10)
  final String? areaOfResturantEn;
  @HiveField(11)
  final String status;
  @HiveField(12)
  final List<String> categoryName;

  const RestaurantModel({
    required this.id,
    required this.serviceId,
    this.nameOfResturantAr,
    this.nameOfResturantEn,
    this.descriptionAr,
    this.descriptionEn,
    this.logo,
    required this.rate,
    this.nameOfResturantOwner,
    this.areaOfResturantAr,
    this.areaOfResturantEn,
    required this.status,
    required this.categoryName,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] ??0,
      serviceId: json['serviceId'] ??0,
      nameOfResturantAr: json['nameOfResturantAr'] ??"",
      nameOfResturantEn: json['nameOfResturantEn'] ??"",
      descriptionAr: json['descriptionAr'] ??"",
      descriptionEn: json['descriptionEn'] ??"",
      logo: json['logo'] ??"",
      rate: (json['rate'] ??0).toDouble(),
      nameOfResturantOwner: json['nameOfResturantOwner'] ??"",
      areaOfResturantAr: json['areaOfResturantAr'] ??"",
      areaOfResturantEn: json['areaOfResturantEn'] ??"",
      status: json['status'] ??"",
      categoryName: (json['categoryName'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serviceId': serviceId,
      'nameOfResturantAr': nameOfResturantAr,
      'nameOfResturantEn': nameOfResturantEn,
      'descriptionAr': descriptionAr,
      'descriptionEn': descriptionEn,
      'logo': logo,
      'rate': rate,
      'nameOfResturantOwner': nameOfResturantOwner,
      'areaOfResturantAr': areaOfResturantAr,
      'areaOfResturantEn': areaOfResturantEn,
      'status': status,
      'categoryName': categoryName,
    };
  }

  RestaurantModel copyWith({
    int? id,
    int? serviceId,
    String? nameOfResturantAr,
    String? nameOfResturantEn,
    String? descriptionAr,
    String? descriptionEn,
    String? logo,
    double? rate,
    String? nameOfResturantOwner,
    String? areaOfResturantAr,
    String? areaOfResturantEn,
    String? status,
    List<String>? categoryName,
  }) {
    return RestaurantModel(
      id: id ?? this.id,
      serviceId: serviceId ?? this.serviceId,
      nameOfResturantAr: nameOfResturantAr ?? this.nameOfResturantAr,
      nameOfResturantEn: nameOfResturantEn ?? this.nameOfResturantEn,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      logo: logo ?? this.logo,
      rate: rate ?? this.rate,
      nameOfResturantOwner: nameOfResturantOwner ?? this.nameOfResturantOwner,
      areaOfResturantAr: areaOfResturantAr ?? this.areaOfResturantAr,
      areaOfResturantEn: areaOfResturantEn ?? this.areaOfResturantEn,
      status: status ?? this.status,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  @override
  List<Object?> get props => [
        id,
        serviceId,
        nameOfResturantAr,
        nameOfResturantEn,
        descriptionAr,
        descriptionEn,
        logo,
        rate,
        nameOfResturantOwner,
        areaOfResturantAr,
        areaOfResturantEn,
        status,
        categoryName,
      ];
}
