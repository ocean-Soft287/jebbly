import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.hint});
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 13.5.w, vertical: 12.5.h),
        color: AppColors.white,
        child: SizedBox(
            height: 43.h,
            width: double.infinity,
            child: SearchBar(
                elevation: WidgetStatePropertyAll(0),
                backgroundColor: WidgetStatePropertyAll(AppColors.grey0),
                leading: Icon(Icons.search),
                hintText: hint,
                hintStyle: WidgetStatePropertyAll(Styles.textStyle16_500))));
  }
}