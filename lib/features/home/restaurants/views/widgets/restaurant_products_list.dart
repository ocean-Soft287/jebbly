import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_product.dart';

class RestaurantProductsList extends StatelessWidget {
  const RestaurantProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, i) => const RestaurantProduct(),
        separatorBuilder: (_, i) => const CustomDivider(),
        itemCount: 15);
  }
}