import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/Jeebly_shop.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/home_search_bar.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/jeebly_get.dart';

import '../../../../../core/service_locator/service_locator.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../jeebly_eat/jeebly_eat_imports.dart';
import '../../../jeebly_eat/manager/search_restaurant_bloc/search_restaurant_bloc.dart';
import '../../../restaurants/manager/restaurannt_bloc/restaurant_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
        body: Column(
          children: [
            // const CustomDivider(),
            HomeSearchBar(index: index),
            // const CustomDivider(),
            index == 0
                ? const Expanded(child: JeeblyEat())
                : index == 1
                    ? const JeeblyGet()
                    : const JeeblyShop()
          ]
        ));
  }
}