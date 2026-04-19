import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/category_rastaurants_model.dart';
import 'category_restaurants_item.dart';

class CategoryRestaurantsGrid extends StatelessWidget {
  final List<CategoryRestaurantsModel> restaurants;

  const CategoryRestaurantsGrid({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      itemCount: restaurants.length,
      itemBuilder: (context, index) => CategoryRestaurantsItem(
        restaurant: restaurants[index],
      ),
    );
  }
}