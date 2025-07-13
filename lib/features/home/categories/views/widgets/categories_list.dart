import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/features/home/categories/views/widgets/category_button.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    List<CategoryButton> categories = items
        .asMap()
        .entries
        .map((entry) =>
            CategoryButton(categoryName: entry.value, index: entry.key))
        .toList();

    return SizedBox(
        height: 30.h,
        child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => categories[index],
            separatorBuilder: (_, index) => Gap(7.w),
            itemCount: categories.length));
  }
}