import 'package:equatable/equatable.dart';

class GeneralCartModel extends Equatable {
  final int restaurantId;
  final String restaurantName;
  final String logo;
  final double rate;
  final int reviewsCount; // optional — from rate field aggregations
  final List<CartProductModel> products;

  const GeneralCartModel({
    required this.restaurantId,
    required this.restaurantName,
    required this.logo,
    required this.rate,
    this.reviewsCount = 0,
    required this.products,
  });

  // المجموع الكلي للكميات في السلة الخاصة بالمطعم
  int get totalQuantity =>
      products.fold<int>(0, (sum, p) => sum + p.quantity);

  // المجموع الكلي للسعر
  double get totalPrice =>
      products.fold<double>(0, (sum, p) => sum + (p.price * p.quantity));

  factory GeneralCartModel.fromJson(Map<String, dynamic> json) {
    return GeneralCartModel(
      restaurantId: json['restaurantId'] as int,
      restaurantName: (json['restaurantName'] ?? '') as String,
      logo: (json['logo'] ?? '') as String,
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      reviewsCount: (json['reviewsCount'] as int?) ?? 0,
      products: ((json['products'] as List?) ?? [])
          .map((e) => CartProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'restaurantId': restaurantId,
    'restaurantName': restaurantName,
    'logo': logo,
    'rate': rate,
    'reviewsCount': reviewsCount,
    'products': products.map((e) => e.toJson()).toList(),
  };

  GeneralCartModel copyWith({
    int? restaurantId,
    String? restaurantName,
    String? logo,
    double? rate,
    int? reviewsCount,
    List<CartProductModel>? products,
  }) {
    return GeneralCartModel(
      restaurantId: restaurantId ?? this.restaurantId,
      restaurantName: restaurantName ?? this.restaurantName,
      logo: logo ?? this.logo,
      rate: rate ?? this.rate,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props =>
      [restaurantId, restaurantName, logo, rate, reviewsCount, products];
}

class CartProductModel extends Equatable {
  final int productId;
  final String? nameAr;
  final String? nameEn;
  final String? imageUrl;
  final double price;
  final int quantity;

  const CartProductModel({
    required this.productId,
    this.nameAr,
    this.nameEn,
    this.imageUrl,
    required this.price,
    required this.quantity,
  });

  // اسم المنتج حسب اللغة الحالية مع fallback
  String displayName(bool localeCode) {
    if (localeCode) return nameAr ?? nameEn ?? '';
    return nameEn ?? nameAr ?? '';
  }

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      productId: json['productId'] as int,
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
      imageUrl: json['imageUrl'] as String?,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      quantity: (json['quantity'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'nameAr': nameAr,
    'nameEn': nameEn,
    'imageUrl': imageUrl,
    'price': price,
    'quantity': quantity,
  };

  CartProductModel copyWith({
    int? productId,
    String? nameAr,
    String? nameEn,
    String? imageUrl,
    double? price,
    int? quantity,
  }) {
    return CartProductModel(
      productId: productId ?? this.productId,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props =>
      [productId, nameAr, nameEn, imageUrl, price, quantity];
}