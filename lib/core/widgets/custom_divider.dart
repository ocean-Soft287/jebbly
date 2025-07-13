import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.thickness, this.color, this.height});
  final double? thickness, height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
        thickness: thickness ?? .09.h,
        color: color ?? AppColors.black0,
        height: height ?? thickness ?? .09.h);
  }
}