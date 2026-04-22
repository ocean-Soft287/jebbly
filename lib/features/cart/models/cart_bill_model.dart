import 'package:equatable/equatable.dart';

class CartBillModel extends Equatable {
  final double itemsPrice;
  final double deliveryFee;
  final double serviceFee;
  final bool isServiceFree;

  const CartBillModel({
    required this.itemsPrice,
    required this.deliveryFee,
    required this.serviceFee,
    this.isServiceFree = false,
  });

  // المجموع الكلي
  double get total =>
      itemsPrice + deliveryFee + (isServiceFree ? 0 : serviceFee);

  factory CartBillModel.empty() => const CartBillModel(
    itemsPrice: 0,
    deliveryFee: 0,
    serviceFee: 0,
    isServiceFree: true,
  );

  factory CartBillModel.fromJson(Map<String, dynamic> json) {
    return CartBillModel(
      itemsPrice: (json['itemsPrice'] as num?)?.toDouble() ?? 0,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0,
      serviceFee: (json['serviceFee'] as num?)?.toDouble() ?? 0,
      isServiceFree: (json['isServiceFree'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'itemsPrice': itemsPrice,
    'deliveryFee': deliveryFee,
    'serviceFee': serviceFee,
    'isServiceFree': isServiceFree,
  };

  CartBillModel copyWith({
    double? itemsPrice,
    double? deliveryFee,
    double? serviceFee,
    bool? isServiceFree,
  }) {
    return CartBillModel(
      itemsPrice: itemsPrice ?? this.itemsPrice,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      serviceFee: serviceFee ?? this.serviceFee,
      isServiceFree: isServiceFree ?? this.isServiceFree,
    );
  }

  @override
  List<Object?> get props => [itemsPrice, deliveryFee, serviceFee, isServiceFree];
}