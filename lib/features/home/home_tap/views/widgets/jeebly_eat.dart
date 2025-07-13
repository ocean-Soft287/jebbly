import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/all_restaurants.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/categories.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/unique_restaurants.dart';

class JeeblyEat extends StatelessWidget {
  const JeeblyEat({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [Categories(), UniqueRestaurants(), AllRestaurants()];
    return Expanded(
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsetsDirectional.only(top: 10.h, start: 10.w),
            itemBuilder: (_, index) => items[index],
            separatorBuilder: (_, index) => Gap(index == 2 ? 12.h : 28.h),
            itemCount: items.length));
  }
}