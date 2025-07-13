import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/features/home/stores/views/widgets/products_grid.dart';
import 'package:jeebly_mobile/features/home/stores/views/widgets/store_category_app_bar.dart';

class StoreCategoryDetailsScreen extends StatelessWidget {
  const StoreCategoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          StoreCategoryAppBar(),
          ProductsGrid()
        ]
      )
    );
  }
}