import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:jeebly_mobile/features/cart/order_flow/views/widgets/order_details.dart';
import 'package:jeebly_mobile/features/cart/order_flow/views/widgets/order_summary_list.dart';
import 'package:jeebly_mobile/features/cart/order_flow/views/widgets/store_name.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/cart_bottom_sheet.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: AppLocalizations.of(context)!.cart),
        body: ListView(physics: const BouncingScrollPhysics(), children: [
          const Gap(1),
          const StoreName(),
          Gap(2.h),
          const OrderDetails(),
          Gap(2.h),
          const OrderSummaryList()
        ]),
        bottomNavigationBar: CartBottomSheet(
            title: AppLocalizations.of(context)!.confirm_order,
            onPressed: () =>
                GoRouter.of(context).push(RoutesNames.orderConfirmation)));
  }
}