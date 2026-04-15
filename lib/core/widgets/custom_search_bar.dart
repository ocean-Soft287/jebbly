import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.hint, this.onTap});
  final String hint;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 13.5.w, vertical: 12.5.h),
        color: AppColors.white,
        child: SizedBox(
            height: 43.h,
            width: double.infinity,
            child: SearchBar(
              side: WidgetStatePropertyAll<BorderSide>(
                BorderSide(strokeAlign: 1,
                color: AppColors.black1
                )
              ),
                elevation: WidgetStatePropertyAll(0),
                backgroundColor: WidgetStatePropertyAll(AppColors.white),
                leading: Icon(Icons.search),
                onTap: onTap,
                hintText: hint,
                hintStyle: WidgetStatePropertyAll(Styles.textStyle16_500))));
  }
}