import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';

class PasswordLogo extends StatelessWidget {
  const PasswordLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('**',
              style: TextStyle(
                  fontSize: 96.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary)),
          Gap(13.w),
          Container(
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20.r)),
              height: 81.h,
              width: 9.w)
        ]);
  }
}