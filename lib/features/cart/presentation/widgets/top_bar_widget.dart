import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class CartTopBar extends StatelessWidget {
  const CartTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          // أيقونات اليسار (محفظة + مفضلة)
          _IconCircle(
            icon: Icons.account_balance_wallet_outlined,
            onTap: () {
              // TODO: navigate to wallet
            },
          ),
          SizedBox(width: 8.w),
          _IconCircle(
            icon: Icons.favorite_border,
            onTap: () {
              // TODO: navigate to favorites
            },
          ),
          const Spacer(),
          // التوصيل إلى (يمين في RTL)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                AppLocalizations.of(context)!.deliver_to,
                style: AppTextTheme.caption.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 2.h),
              GestureDetector(
                onTap: () {
                  // TODO: open address selector
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.home,
                      style: AppTextTheme.body1.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.ketchup1,
                      size: 22.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _IconCircle extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _IconCircle({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.all(6.w),
        child: Icon(icon, size: 24.sp, color: Colors.black87),
      ),
    );
  }
}