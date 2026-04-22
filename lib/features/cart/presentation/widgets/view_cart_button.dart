import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_theme.dart';

class ViewCartButton extends StatelessWidget {
  final int totalQuantity;
  final double totalPrice;
  final VoidCallback onTap;

  const ViewCartButton({
    super.key,
    required this.totalQuantity,
    required this.totalPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30.r),
      child: Container(
        width: double.infinity,
        height: 48.h,
        decoration: BoxDecoration(
          color: const Color(0xFFFF5722), // البرتقالي الموجود في التصميم
          borderRadius: BorderRadius.circular(30.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            // عدد العناصر (يسار)
            Text(
              '$totalQuantity',
              style: AppTextTheme.body1.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            const Spacer(),
            // نص عرض السلة (وسط)
            Text(
              'cart.view_cart',
              style: AppTextTheme.body1.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            const Spacer(),
            // السعر (يمين في RTL)
            Text(
              '${totalPrice.toStringAsFixed(2)} ${'cart.currency'}',
              style: AppTextTheme.body1.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}