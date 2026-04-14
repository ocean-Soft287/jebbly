import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/horizontal_divider.dart';

import '../../models/restaurants_details_model.dart';

class RestaurantData extends StatelessWidget {
  final RestaurantDetailsModel restaurant;

  const RestaurantData({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    // ── Delivery time label: "21 - 22 د" ──
    final prepTime =
        '${restaurant.minDeliveryTime} - ${restaurant.maxDeliveryTime} Minutes';

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.grey0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 9.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ── Delivery Fee ──
          Column(children: [
            Text(
              local.delivery,
              style: Styles.textStyle12_600.copyWith(color: AppColors.grey0),
            ),
            Gap(6.h),
            // ⚠️ deliveryFee not in API yet → placeholder until backend adds it
            Text(
              restaurant.deliveryFee != null
                  ? '${restaurant.deliveryFee!.toStringAsFixed(2)} د.ل '
                  : '--',
              style: Styles.textStyle10_600,
            ),
          ]),

          HorizontalDivider(height: 30.h),

          // ── Rating ──
          Column(children: [
            Text(
              local.rating,
              style: Styles.textStyle12_600.copyWith(color: AppColors.grey0),
            ),
            Gap(6.h),
            Row(children: [
              Icon(Icons.star, color: AppColors.yellow, size: 10.sp),
              Text(
                restaurant.rate.toStringAsFixed(1),
                style:
                Styles.textStyle10_300.copyWith(color: AppColors.black0),
              ),
            ]),
          ]),

          HorizontalDivider(height: 30.h),

          // ── Preparation Time ──
          Column(children: [
            Text(
              local.preparation_time,
              style: Styles.textStyle12_600.copyWith(color: AppColors.grey0),
            ),
            Gap(6.h),
            Text(prepTime, style: Styles.textStyle10_600),
          ]),
        ],
      ),
    );
  }
}