import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/horizontal_divider.dart';

class StoreInfo extends StatelessWidget {
  const StoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ///Delivery
        Column(children: [
          Text(AppLocalizations.of(context)!.delivery,
              style: Styles.textStyle12_600.copyWith(color: AppColors.grey0)),
          Text('7.25 د.ل', style: Styles.textStyle10_600)
        ]),
        HorizontalDivider(height: 30.h),

        ///Rating
        Column(children: [
          Text(AppLocalizations.of(context)!.rating,
              style: Styles.textStyle12_600.copyWith(color: AppColors.grey0)),
          Row(children: [
            Icon(Icons.star, color: AppColors.yellow, size: 10.sp),
            Text('4.1',
                style:
                Styles.textStyle10_300.copyWith(color: AppColors.black0)),
            Text(' (615)', style: Styles.textStyle10_300)
          ])
        ]),
        HorizontalDivider(height: 30.h),
        Column(children: [
          Text(AppLocalizations.of(context)!.preparation_time,
              style: Styles.textStyle12_600.copyWith(color: AppColors.grey0)),
          Text('30 د', style: Styles.textStyle10_600)
        ])
      ]),
    );
  }
}
