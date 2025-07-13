import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/cart/order_flow/cubit/order_flow_cubit.dart';
import 'package:jeebly_mobile/features/cart/order_flow/cubit/order_flow_state.dart';
import 'package:jeebly_mobile/features/cart/order_flow/views/widgets/payment_method.dart';

class PaymentMethodsList extends StatelessWidget {
  const PaymentMethodsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderFlowCubit, OrderFlowState>(builder: (_, state) {
      var cubit = OrderFlowCubit.get(context);
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomText(AppLocalizations.of(context)!.payment_method,
            style: Styles.textStyle16_500.copyWith(color: AppColors.black0)),
        Gap(10.h),
        PaymentMethod(
            title: AppLocalizations.of(context)!.in_cash,
            icon: AppAssets.cash,
            cubit: cubit,
            index: 0),
        PaymentMethod(
            title: AppLocalizations.of(context)!.wallet,
            icon: AppAssets.wallet,
            cubit: cubit,
            index: 1),
        PaymentMethod(
            title: 'مصرفي باي',
            icon: AppAssets.musrafi,
            cubit: cubit,
            index: 2),
        PaymentMethod(
            title: 'يسر أونلاين', icon: AppAssets.yosr, cubit: cubit, index: 3),
        PaymentMethod(
            title: 'البطاقة المصرفية (أونلاين)',
            icon: AppAssets.card,
            cubit: cubit,
            index: 4),
        PaymentMethod(
            title: 'ادفعلي', icon: AppAssets.edf3ly, cubit: cubit, index: 5),
        PaymentMethod(
            title: 'موبي كاش',
            icon: AppAssets.mobicash,
            cubit: cubit,
            index: 6),
        PaymentMethod(
            title: 'سداد', icon: AppAssets.sdad, cubit: cubit, index: 7)
      ]);
    });
  }
}