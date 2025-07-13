import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/counter_box.dart';
import 'package:jeebly_mobile/core/widgets/custom_network_image.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:jeebly_mobile/core/widgets/product/delivery_toggle_button.dart';
import 'package:jeebly_mobile/features/cart/order_flow/cubit/order_flow_cubit.dart';
import 'package:jeebly_mobile/features/cart/order_flow/cubit/order_flow_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        color: Colors.white,
        child: Column(
            spacing: 15.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<OrderFlowCubit, OrderFlowState>(builder: (_, state) {
                var cubit = OrderFlowCubit.get(context);
                return DeliveryToggleButton(cubit: cubit);
              }),
              Text(AppLocalizations.of(context)!.order_items,
                  style:
                      Styles.textStyle16_500.copyWith(color: AppColors.black0)),
              Row(children: [
                CustomNetworkImage(
                    url: 'https://img.youm7.com/large/1201524121954.jpg',
                    height: 86.h,
                    width: 92.w,
                    radius: 11.r),
                Gap(7.w),
                Column(spacing: 8.h, children: [
                  CustomText('كنافة بالجمبري - 4 قطع',
                      style: Styles.textStyle16_500
                          .copyWith(color: AppColors.black0)),
                  CounterBox(initialCount: 1)
                ]),
                const Spacer(),
                Column(children: [
                  CircleAvatar(
                      maxRadius: 15.sp,
                      backgroundColor: AppColors.grey0,
                      child: CustomSVG(assetName: AppAssets.deleteGrey)),
                  CustomText('25 د.ل',
                      style: Styles.textStyle16_500
                          .copyWith(color: AppColors.black0))
                ])
              ])
            ]));
  }
}