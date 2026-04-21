import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part 'product_model.g.dart';

@HiveType(typeId: 21)
class ProductModel extends Equatable {
  @HiveField(0)
  final int? serviceId;
  @HiveField(1)
  final int restaurantId;
  @HiveField(2)
  final int id;
  @HiveField(3)
  final String nameAr;
  @HiveField(4)
  final String nameEn;
  @HiveField(5)
  final String descriptionAr;
  @HiveField(6)
  final String descriptionEn;
  @HiveField(7)
  final bool isActive;
  @HiveField(8)
  final String imageUrl;
  @HiveField(9)
  final double price;
  @HiveField(10)
  final int categoryId;
  @HiveField(11)
  final String categoryName;
  @HiveField(12)
  final double quantity;
  @HiveField(13)
  final int? subCategoryId;
  @HiveField(14)
  final String? subCategoryName;

  const ProductModel({
    this.serviceId,
    required this.restaurantId,
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.isActive,
    required this.imageUrl,
    required this.price,
    required this.categoryId,
    required this.categoryName,
    required this.quantity,
    this.subCategoryId,
    this.subCategoryName,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      serviceId: json['serviceId'] as int?,
      restaurantId: json['restaurantId'] as int,
      id: json['id'] as int,
      nameAr: json['nameAr'] as String,
      nameEn: json['nameEn'] as String,
      descriptionAr: json['descriptionAr'] as String,
      descriptionEn: json['descriptionEn'] as String,
      isActive: json['isActive'] as bool,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      categoryId: json['categoryId'] as int,
      categoryName: json['categoryName'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      subCategoryId: json['subCategoryId'] as int?,
      subCategoryName: json['subCategoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceId': serviceId,
      'restaurantId': restaurantId,
      'id': id,
      'nameAr': nameAr,
      'nameEn': nameEn,
      'descriptionAr': descriptionAr,
      'descriptionEn': descriptionEn,
      'isActive': isActive,
      'imageUrl': imageUrl,
      'price': price,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'quantity': quantity,
      'subCategoryId': subCategoryId,
      'subCategoryName': subCategoryName,
    };
  }

  @override
  List<Object?> get props => [
        serviceId,
        restaurantId,
        id,
        nameAr,
        nameEn,
        descriptionAr,
        descriptionEn,
        isActive,
        imageUrl,
        price,
        categoryId,
        categoryName,
        quantity,
        subCategoryId,
        subCategoryName,
      ];
}
