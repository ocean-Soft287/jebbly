import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/features/home/restaurants/manager/product_bloc/product_bloc.dart';
import 'package:jeebly_mobile/features/home/restaurants/models/product_model.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_product.dart';
import '../../../../../core/bloc/base_bloc.dart';

class RestaurantProductsList extends StatelessWidget {
  final int restaurantId;
  final int categoryId;
  const RestaurantProductsList({super.key, required this.restaurantId, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, BaseState<ProductModel>>(
      builder: (context, state) {
        if (state.isLoading && state.items.isEmpty) {
          return const SizedBox(
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state.isFailure && state.items.isEmpty) {
          return SizedBox(
            height: 100,
            child: Center(child: Text(state.errorMessage ?? 'حدث خطأ')),
          );
        }
        if (state.items.isEmpty) {
          return const SizedBox(
            height: 100,
            child: Center(child: Text('لا توجد منتجات')),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, i) => RestaurantProduct(product: state.items[i]),
          separatorBuilder: (_, i) => const CustomDivider(),
          itemCount: state.items.length,
        );
      },
    );
  }
}