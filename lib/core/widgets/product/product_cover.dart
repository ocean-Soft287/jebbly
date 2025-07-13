import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_network_image.dart';

class ProductCover extends StatelessWidget {
  const ProductCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomNetworkImage(
          height: 241.h,
          width: double.infinity,
          url:
          'https://cdn.apartmenttherapy.info/image/upload/f_jpg,q_auto:eco,c_fill,g_auto,w_1500,ar_16:9/k%2FPhoto%2FRecipes%2F2020-07-how-to-make-a-milkshake-at-home%2F2020-06-08_AT-K19388'),
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
