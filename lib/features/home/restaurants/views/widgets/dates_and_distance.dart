import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';

import '../../models/restaurants_details_model.dart';

class DatesAndDistance extends StatelessWidget {
  final RestaurantDetailsModel restaurant;

  const DatesAndDistance({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    // ⚠️ isOpen + workSchedule not in API yet → defaulting to open for now
    final bool isOpen = restaurant.isOpenNow;

    // ⚠️ distanceKm not in API yet → show lat/lng-based placeholder if null
    final String distanceLabel = restaurant.distanceKm != null
        ? '${restaurant.distanceKm!.toStringAsFixed(1)}${local.km}'
        : '-- ${local.km}';

    return Row(children: [
      // ── Open / Schedule ──
      Container(
        decoration: BoxDecoration(
          color: AppColors.grey0,
          borderRadius: BorderRadius.circular(4.r),
        ),
        padding: EdgeInsets.all(6.sp),
        child: Row(children: [
          Icon(
            Icons.access_time_outlined,
            color: isOpen ? AppColors.green0 : AppColors.red,
            size: 15.sp,
          ),
          Gap(4.w),
          Text(
            isOpen ? local.open : local.closed,
            style: Styles.textStyle10_500.copyWith(
              color: isOpen ? AppColors.green0 : AppColors.red,
            ),
          ),
          Text(
            ' . ${local.work_schedule}',
            style:
            Styles.textStyle10_500.copyWith(color: AppColors.grey2),
          ),
          Icon(Icons.keyboard_arrow_down, size: 19.sp),
        ]),
      ),

      Gap(5.w),

      // ── Distance ──
      Container(
        height: 30.h,
        decoration: BoxDecoration(
          color: AppColors.grey0,
          borderRadius: BorderRadius.circular(4.r),
        ),
        padding: EdgeInsets.all(6.sp),
        child: Row(children: [
          Text(
            distanceLabel,
            style:
            Styles.textStyle10_500.copyWith(color: AppColors.grey2),
          ),
          Gap(4.w),
          Stack(children: [
            CustomSVG(assetName: AppAssets.distance),
            Positioned(
              top: 2,
              right: 2,
              child: Icon(Icons.arrow_back, size: 5.sp),
            ),
          ]),
        ]),
      ),
    ]);
  }
}