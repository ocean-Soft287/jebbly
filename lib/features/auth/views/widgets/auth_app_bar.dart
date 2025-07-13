import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:jeebly_mobile/core/widgets/custom_image.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        backgroundImage:
            CustomImage(imagePath: AppAssets.authBackground, fit: BoxFit.fill));
  }

  @override
  Size get preferredSize => Size.fromHeight(132.h);
}