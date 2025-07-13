import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';

class DrawerAppBar extends StatelessWidget {
  const DrawerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 49.h,
        width: double.infinity,
        color: AppColors.primary,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: Icon(CupertinoIcons.xmark, color: AppColors.white))
        ]));
  }
}