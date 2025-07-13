import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';

class DatesAndDistance extends StatelessWidget {
  const DatesAndDistance({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          decoration: BoxDecoration(
              color: AppColors.grey0, borderRadius: BorderRadius.circular(4.r)),
          padding: EdgeInsets.all(6.sp),
          child: Row(children: [
            Icon(Icons.access_time_outlined,
                color: AppColors.green0, size: 15.sp),
            Gap(4.w),
            Text(AppLocalizations.of(context)!.open,
                style: Styles.textStyle10_500.copyWith(color: AppColors.green0)),
            Text(' . ${AppLocalizations.of(context)!.work_schedule}',
                style: Styles.textStyle10_500.copyWith(color: AppColors.grey2)),
            Icon(Icons.keyboard_arrow_down, size: 19.sp)
          ])),
      Gap(5.w),
      Container(
          height: 30.h,
          decoration: BoxDecoration(
              color: AppColors.grey0, borderRadius: BorderRadius.circular(4.r)),
          padding: EdgeInsets.all(6.sp),
          child: Row(children: [
            Text('0.8${AppLocalizations.of(context)!.km}',
                style: Styles.textStyle10_500.copyWith(color: AppColors.grey2)),
            Gap(4.w),
            Stack(children: [
              CustomSVG(assetName: AppAssets.distance),
              Positioned(
                  top: 2, right: 2, child: Icon(Icons.arrow_back, size: 5.sp))
            ])
          ]))
    ]);
  }
}