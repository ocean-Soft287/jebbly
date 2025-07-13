import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeliveryInfo extends StatelessWidget {
  const DeliveryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomText(AppLocalizations.of(context)!.delivery_info,
          style: Styles.textStyle16_500.copyWith(color: AppColors.black0)),
      Gap(20.h),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r)),
          child: Row(children: [
            CustomSVG(assetName: AppAssets.locationII),
            Gap(4.w),
            Column(children: [
              CustomText('البيت', style: Styles.textStyle12_400),
              Text('r6mw+h2f',
                  style:
                      Styles.textStyle11_300.copyWith(color: AppColors.black0))
            ]),
            const Spacer(),
            IntrinsicWidth(
              child: CustomButton(
                  backgroundColor: AppColors.ketchup2,
                  textStyle:
                      Styles.textStyle11_600.copyWith(color: AppColors.primary),
                  onPressed: () {},
                  text: AppLocalizations.of(context)!.edit,
                  height: 25.h),
            )
          ])),
      Gap(9.h),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r)),
          child: Row(children: [
            CustomSVG(assetName: AppAssets.person),
            Gap(4.w),
            Column(children: [
              CustomText('أبو بكر علي أحمد', style: Styles.textStyle12_400),
              CustomText('01557712317',
                  style:
                      Styles.textStyle11_300.copyWith(color: AppColors.black0))
            ])
          ]))
    ]);
  }
}