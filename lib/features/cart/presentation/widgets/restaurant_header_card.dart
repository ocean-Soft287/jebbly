import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/flexible_image.dart';
import '../../../../l10n/app_localizations.dart';
import '../../models/general_cart_model.dart';

class RestaurantHeaderCard extends StatelessWidget {
  final GeneralCartModel restaurant;
  final bool isClosed; // TODO: اربط هذه القيمة بحالة المطعم الفعلية
  const RestaurantHeaderCard({
    super.key,
    required this.restaurant,
    this.isClosed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child: FlexibleImage(
              source: restaurant.logo,
              width: 60.w,
              height: 60.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  restaurant.restaurantName,
                  style: AppTextTheme.body1.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.end,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '(${restaurant.reviewsCount})',
                      style: AppTextTheme.caption
                          .copyWith(color: Colors.grey.shade600),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      restaurant.rate.toStringAsFixed(1),
                      style: AppTextTheme.caption.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Icon(Icons.star, color: Colors.amber, size: 16.sp),
                  ],
                ),
              ],
            ),
          ),
          // سهم الدخول إلى صفحة المطعم (يسار)

          const Spacer(),
          // badge "مغلق" — اختياري
          if (isClosed)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE5E5),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                AppLocalizations.of(context)!.closed,
                style: AppTextTheme.caption.copyWith(
                  color: Colors.red.shade400,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
            ),

          // اسم المطعم + التقييم (يمين)
          SizedBox(width: 8.w),
          Icon(
            Icons.arrow_forward_ios,
            size: 18.sp,
            color: Colors.grey.shade500,
          ),
          // شعار المطعم
        ],
      ),
    );
  }
}
