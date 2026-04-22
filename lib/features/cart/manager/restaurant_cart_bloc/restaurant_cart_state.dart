import 'package:equatable/equatable.dart';

import '../../../../core/bloc/base_bloc.dart';
import '../../models/cart_bill_model.dart';
import '../../models/general_cart_model.dart';

class RestaurantCartState extends Equatable {
  final Status status;
  final GeneralCartModel? restaurant;
  final CartBillModel bill;
  final List<CartProductModel> recommendations;
  final String storeNote;
  final String errorMessage;

  const RestaurantCartState({
    this.status = Status.initial,
    this.restaurant,
    required this.bill,
    this.recommendations = const [],
    this.storeNote = '',
    this.errorMessage = '',
  });

  factory RestaurantCartState.initial() => RestaurantCartState(
    bill: CartBillModel.empty(),
  );

  // إجمالي الكمية في السلة
  int get totalQuantity =>
      restaurant?.products.fold<int>(0, (sum, p) => sum + p.quantity) ?? 0;

  bool get isEmpty => restaurant == null || restaurant!.products.isEmpty;

  RestaurantCartState copyWith({
    Status? status,
    GeneralCartModel? restaurant,
    CartBillModel? bill,
    List<CartProductModel>? recommendations,
    String? storeNote,
    String? errorMessage,
    bool clearRestaurant = false,
  }) {
    return RestaurantCartState(
      status: status ?? this.status,
      restaurant: clearRestaurant ? null : (restaurant ?? this.restaurant),
      bill: bill ?? this.bill,
      recommendations: recommendations ?? this.recommendations,
      storeNote: storeNote ?? this.storeNote,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    restaurant,
    bill,
    recommendations,
    storeNote,
    errorMessage,
  ];
}