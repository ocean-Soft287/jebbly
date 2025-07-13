import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key, this.width, this.height});
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? 150.sp,
        height: height ?? 150.sp,
        child: SpinKitRipple(color: AppColors.primary));
  }
}