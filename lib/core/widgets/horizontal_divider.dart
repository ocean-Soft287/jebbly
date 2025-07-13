import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key, this.width, this.height});
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? 1.w,
        height: height ?? double.infinity,
        color: AppColors.grey0);
  }
}