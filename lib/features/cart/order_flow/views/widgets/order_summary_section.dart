import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/helpers/functions/items_count.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentLang = Localizations.localeOf(context).languageCode;
    return Column(
      spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      CustomText(AppLocalizations.of(context)!.order_summary, style: Styles.textStyle16_500.copyWith(color: AppColors.black0)),
      Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r)),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: Row(children: [
            CustomText(ItemsCount.count(1, currentLang, upperFirst: true), style: Styles.textStyle11_300.copyWith(color: AppColors.black0)),
            Gap(16.w),
            CustomText('25 د.ل', style: Styles.textStyle11_300.copyWith(color: AppColors.black0)),
            const Spacer(),
            Icon(Icons.keyboard_arrow_down)
          ]))
    ]);
  }
}