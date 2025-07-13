import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/features/cart/order_flow/views/widgets/delivery_info.dart';
import 'package:jeebly_mobile/features/cart/order_flow/views/widgets/order_summary_section.dart';
import 'package:jeebly_mobile/features/cart/order_flow/views/widgets/payment_methods_list.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/cart_bottom_sheet.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            CustomAppBar(title: AppLocalizations.of(context)!.confirm_order),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 14.h),
            physics: const BouncingScrollPhysics(),
            children: [
              ///======= Order Summary =======///
              const OrderSummarySection(),

              ///============================================================///

              Gap(17.h),

              ///======= Delivery Info =======///
              const DeliveryInfo(),

              ///============================================================///

              Gap(18.h),

              ///======= Payment Method =======///
              const PaymentMethodsList()
            ]),
        bottomNavigationBar: CartBottomSheet(
            title: AppLocalizations.of(context)!.confirm_order,
            onPressed: () =>
                GoRouter.of(context).push(RoutesNames.orderStatus)));
  }
}