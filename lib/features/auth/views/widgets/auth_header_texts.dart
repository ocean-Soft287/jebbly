import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';

class AuthHeaderTexts extends StatelessWidget {
  const AuthHeaderTexts({super.key, required this.header, required this.body});
  final String header, body;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 28.h),
        child: Column(children: [
          Text(header, style: Styles.textStyle20),
          Text(body, style: Styles.textStyle14_400.copyWith(color: AppColors.grey1), textAlign: TextAlign.center)
        ]));
  }
}