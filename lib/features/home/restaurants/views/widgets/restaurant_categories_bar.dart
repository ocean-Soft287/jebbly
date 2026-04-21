import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/features/home/restaurants/manager/restaurant_category_bloc/restaurant_category_bloc.dart';
import 'package:jeebly_mobile/features/home/restaurants/models/restaurant_category_model.dart';

class RestaurantCategoriesBar extends StatefulWidget {
  final Function(int categoryId) onCategorySelected;
  const RestaurantCategoriesBar({super.key, required this.onCategorySelected});

  @override
  State<RestaurantCategoriesBar> createState() => _RestaurantCategoriesBarState();
}

class _RestaurantCategoriesBarState extends State<RestaurantCategoriesBar> {
  int? selectedId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCategoryBloc, BaseState<RestaurantCategoryModel>>(
      builder: (context, state) {
        if (state.items.isEmpty) return const SizedBox.shrink();

        // Set initial selection if not set
        if (selectedId == null && state.items.isNotEmpty) {
          selectedId = state.items.first.id;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.onCategorySelected(selectedId!);
          });
        }

        return SizedBox(
          height: 50.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = state.items[index];
              final isSelected = selectedId == item.id;
              
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedId = item.id;
                  });
                  widget.onCategorySelected(item.id);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : AppColors.transparent,
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : Colors.grey.shade300,
                    ),
                  ),
                  child: Text(
                    item.name,
                    style: Styles.textStyle14_500.copyWith(
                      color: isSelected ? AppColors.white : Colors.black87,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
            itemCount: state.items.length,
          ),
        );
      },
    );
  }
}
