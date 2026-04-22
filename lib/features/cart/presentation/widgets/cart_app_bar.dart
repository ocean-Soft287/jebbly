import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../l10n/app_localizations.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        children: [
          // زر المشاركة (يسار)
          IconButton(
            icon: Icon(Icons.ios_share_outlined, size: 22.sp),
            onPressed: () {
              // TODO: share cart
            },
          ),
          const Spacer(),
          // العنوان
          Text(
            AppLocalizations.of(context)!.title,
            style: AppTextTheme.body1.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          const Spacer(),
          // زر الرجوع (يمين في RTL)
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, size: 20.sp),
            onPressed: () {
              if (context.canPop()) context.pop();
            },
          ),
        ],
      ),
    );
  }
}