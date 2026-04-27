import 'package:flutter/material.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/home_search_bar.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../jeebly_eat/jeebly_eat_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    int serviceId = 0;
    if (index == 0) {
      serviceId = 1;
    } else if (index == 1) {
      serviceId = 2;
    } else if (index == 2) {
      serviceId = 3;
    }
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Column(children: [
          // const CustomDivider(),
          HomeSearchBar(index: index),
          // const CustomDivider(),
          Expanded(
              child: JeeblyEat(
            serviceId: serviceId,
          ))
        ]));
  }
}
