import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/cart_bottom_sheet.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_cover.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_header.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_products_list.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_search.dart' show RestaurantSearch;

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: ListView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: const [
          RestaurantCover(),
          RestaurantHeader(),
          CustomDivider(),
          RestaurantSearch(),
          RestaurantProductsList()
        ]),
      bottomSheet: const CartBottomSheet()
    );
  }
}