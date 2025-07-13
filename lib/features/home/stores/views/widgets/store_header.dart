import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_network_image.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StoreHeader extends StatelessWidget {
  const StoreHeader({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isTablet = width > 480.h;
    return Column(children: [
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BackButton(),
        Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Row(children: [
              CustomNetworkImage(
                  width: 74.sp,
                  height: 74.sp,
                  url:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0vXo6LeNxyHhymrkRu23bNjfx5YRsSzOj4w&s',
                  radius: 999999999999999),
              SizedBox(
                  width: isTablet ? width * .75 : width * .5,
                  child: Column(children: [
                    CustomText('محل الأثير موبايل - عين زارة',
                        style: Styles.textStyle15_500),
                    CustomText('هواتف و أكسسوارات ذكية',
                        style: Styles.textStyle12_400
                            .copyWith(color: AppColors.grey1))
                  ])),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                      color: AppColors.ketchup1,
                      borderRadius: BorderRadius.circular(4.r)),
                  child: CustomText(AppLocalizations.of(context)!.closed,
                      style: Styles.textStyle11_600
                          .copyWith(color: AppColors.primary)))
            ]))
      ]),
      Gap(12.h),
      Container(
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
              color: AppColors.blue1, borderRadius: BorderRadius.circular(5.r)),
          child: CustomText(
              '${AppLocalizations.of(context)!.discounts_up_to} 25%',
              style: Styles.textStyle12_400.copyWith(color: AppColors.blue0)))
    ]);
  }
}