import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            margin: EdgeInsetsDirectional.only(end: 22.w),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5.r)),
            child: CustomSVG(assetName: AppAssets.moon)));
  }
}