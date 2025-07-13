import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/Jeebly_shop.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/home_search_bar.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/jeebly_eat.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/jeebly_get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const CustomDivider(),
            HomeSearchBar(index: index),
            const CustomDivider(),
            index == 0
                ? const JeeblyEat()
                : index == 1
                ? const JeeblyGet()
                : const JeeblyShop()
          ]
        ));
  }
}