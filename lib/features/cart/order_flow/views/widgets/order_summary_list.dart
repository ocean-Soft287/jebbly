import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/helpers/functions/items_count.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:jeebly_mobile/features/cart/order_flow/views/widgets/price_row.dart';

class OrderSummaryList extends StatelessWidget {
  const OrderSummaryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 14.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(AppLocalizations.of(context)!.summary,
              style: Styles.textStyle16_500.copyWith(color: AppColors.black0)),
          CustomText(
              ItemsCount.count(1, Localizations.localeOf(context).languageCode),
              style: Styles.textStyle16_300),
          Gap(16.h),
          PriceRow(title: AppLocalizations.of(context)!.item_price, price: 25),
          CustomDivider(height: 20.h),
          PriceRow(title: AppLocalizations.of(context)!.delivery, price: 9.5),
          CustomDivider(height: 20.h),
          PriceRow(
              title: AppLocalizations.of(context)!.app_commission, price: 0),
          CustomDivider(height: 20.h),
          PriceRow(title: AppLocalizations.of(context)!.total, price: 34.5)
        ]));
  }
}