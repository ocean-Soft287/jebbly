import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/core/widgets/custom_image.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderDetailsBottomSheet extends StatelessWidget {
  const OrderDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return IntrinsicHeight(
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.grey0, width: 1.7.sp),
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(50.r),
                  topEnd: Radius.circular(50.r))),
          child: Column(children: [
            Container(
                decoration: BoxDecoration(
                    color: AppColors.grey0,
                    borderRadius: BorderRadius.circular(5)),
                width: width * .15,
                height: 5.h),
            Gap(22.h),
            Row(children: [
              Text('${AppLocalizations.of(context)!.order_details}: #336743',
                  style: Styles.textStyle16_500.copyWith(color: AppColors.black0))
            ]),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.grey0)),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(children: [
                        Gap(8.w),
                        CircleAvatar(
                            backgroundColor: AppColors.skyBlue,
                            maxRadius: 15.sp,
                            child: CustomSVG(assetName: AppAssets.locationOn)),
                        Gap(8.w),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  AppLocalizations.of(context)!.your_address,
                                  style: Styles.textStyle12_400
                                      .copyWith(color: AppColors.grey1)),
                              Text('r6mw+h2f',
                                  style: Styles.textStyle11_600
                                      .copyWith(color: AppColors.black0))
                            ])
                      ])),
                  CustomDivider(),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(children: [
                        Gap(8.w),
                        CircleAvatar(
                            backgroundColor: AppColors.skyBlue,
                            maxRadius: 15.sp,
                            child: CustomSVG(assetName: AppAssets.summary)),
                        Gap(8.w),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  AppLocalizations.of(context)!
                                      .your_order_summary,
                                  style: Styles.textStyle12_400
                                      .copyWith(color: AppColors.grey1)),
                              CustomText('عنصر واحد . 89 د.ل',
                                  style: Styles.textStyle11_600
                                      .copyWith(color: AppColors.black0))
                            ])
                      ])),
                  const CustomDivider(),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(children: [
                        Gap(8.w),
                        CircleAvatar(
                            backgroundColor: AppColors.skyBlue,
                            maxRadius: 15.sp,
                            child: CustomImage(imagePath: AppAssets.cash)),
                        Gap(8.w),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  AppLocalizations.of(context)!.payment_method,
                                  style: Styles.textStyle12_400
                                      .copyWith(color: AppColors.grey1)),
                              CustomText('نقداً',
                                  style: Styles.textStyle11_600
                                      .copyWith(color: AppColors.black0))
                            ])
                      ]))
                ]))
          ]))
    );
  }
}