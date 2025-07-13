import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/core/widgets/custom_image.dart';
import 'package:jeebly_mobile/features/cart/order_flow/views/widgets/order_details_bottom_sheet.dart';
import 'package:jeebly_mobile/features/cart/order_flow/views/widgets/order_status.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(),
        body: Column(children: [
          const CustomDivider(),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              child: Column(children: [
                const OrderStatus(),
                Gap(26.h),
                const CustomImage(imagePath: AppAssets.watch)
              ]))
        ]),
        bottomSheet: const OrderDetailsBottomSheet());
  }
}