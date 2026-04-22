import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../l10n/app_localizations.dart';

class CartCheckoutBar extends StatelessWidget {
  final double totalPrice;
  final VoidCallback onContinue;

  const CartCheckoutBar({
    super.key,
    required this.totalPrice,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: InkWell(
          onTap: onContinue,
          borderRadius: BorderRadius.circular(30.r),
          child: Container(
            height: 52.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: const Color(0xFFFF5722),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              children: [
                // السعر الكلي (يسار)
                Text(
                  '${totalPrice.toStringAsFixed(2)} ${AppLocalizations.of(context)!.currency}',
                  style: AppTextTheme.body1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                const Spacer(),
                // نص الاستمرار (وسط)
                Text(
                  AppLocalizations.of(context)!.continue_text,
                  style: AppTextTheme.body1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                const Spacer(),
                // للتوازن البصري فقط
                SizedBox(width: 60.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}