import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/cart/order_flow/views/widgets/single_status.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomText(
          AppLocalizations.of(context)!.waiting_for_store_to_accept_your_order,
          style: Styles.textStyle16_500.copyWith(color: AppColors.black0)),
      CustomText(
          AppLocalizations.of(context)!
              .store_is_making_sure_that_products_u_ordered_are_available_before_accepting_your_order,
          style: Styles.textStyle11_300),
      Gap(24.h),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleStatus(
                inProgress: true,
                title:
                    '${AppLocalizations.of(context)!.waiting_for_store_acceptance} 10:48 ص'),
            SingleStatus(
                inProgress: false,
                title: AppLocalizations.of(context)!.preparation_in_progress),
            SingleStatus(
                inProgress: false,
                title: AppLocalizations.of(context)!.in_store),
            SingleStatus(
                inProgress: false,
                title: AppLocalizations.of(context)!.in_the_way),
            SingleStatus(
                inProgress: false,
                title: AppLocalizations.of(context)!.jeebly_is_waiting_u)
          ])
    ]);
  }
}