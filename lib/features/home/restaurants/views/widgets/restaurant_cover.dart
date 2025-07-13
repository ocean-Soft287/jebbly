import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_network_image.dart';

class RestaurantCover extends StatelessWidget {
  const RestaurantCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomNetworkImage(
          height: 155.h,
          width: double.infinity,
          url:
              'https://simply-delicious-food.com/wp-content/uploads/2022/09/Breakfast-board28-500x375.jpg'),
      Container(
          margin: EdgeInsets.all(18.sp),
          decoration:
              BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
          child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(
                  maxHeight: 38.sp,
                  maxWidth: 38.sp,
                  minHeight: 38.sp,
                  minWidth: 38.sp),
              onPressed: () => GoRouter.of(context).pop(),
              icon: Icon(Icons.arrow_back)))
    ]);
  }
}