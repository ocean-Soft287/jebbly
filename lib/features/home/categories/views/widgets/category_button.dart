import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/features/home/categories/cubit/categories_cubit.dart';
import 'package:jeebly_mobile/features/home/categories/cubit/categories_state.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {super.key, required this.categoryName, required this.index});

  final String categoryName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(builder: (_, state) {
      var cubit = CategoriesCubit.get(context);
      return InkWell(
          onTap: () => cubit.selectCategory(index),
          child: Container(
              decoration: BoxDecoration(
                  color: cubit.selectedCategoryIndex == index
                      ? AppColors.ketchup1
                      : null,
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(
                      color: cubit.selectedCategoryIndex == index
                          ? AppColors.primary
                          : AppColors.grey1)),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              child: Text(categoryName,
                  style: Styles.textStyle11_600.copyWith(
                      color: cubit.selectedCategoryIndex == index
                          ? AppColors.primary
                          : null))));
    });
  }
}