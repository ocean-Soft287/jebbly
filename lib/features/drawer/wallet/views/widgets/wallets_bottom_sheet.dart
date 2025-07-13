import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:jeebly_mobile/features/cart/order_flow/views/widgets/payment_method.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/features/drawer/wallet/cubit/wallet_cubit.dart';
import 'package:jeebly_mobile/features/drawer/wallet/cubit/wallet_state.dart';

class WalletsBottomSheet extends StatelessWidget {
  const WalletsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
          padding: EdgeInsets.only(top: 55.h, right: 26.w, left: 26.w),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(48.r))),
          child: BlocBuilder<WalletCubit, WalletState>(builder: (_, state) {
            var cubit = WalletCubit.get(context);
            return Column(mainAxisSize: MainAxisSize.min, children: [
              PaymentMethod(
                  dotIcon: true,
                  title: AppLocalizations.of(context)!.in_cash,
                  icon: AppAssets.cash,
                  cubit: cubit,
                  index: 0),
              PaymentMethod(
                  dotIcon: true,
                  title: AppLocalizations.of(context)!.wallet,
                  icon: AppAssets.wallet,
                  cubit: cubit,
                  index: 1),
              PaymentMethod(
                  dotIcon: true,
                  title: 'مصرفي باي',
                  icon: AppAssets.musrafi,
                  cubit: cubit,
                  index: 2),
              PaymentMethod(
                  dotIcon: true,
                  title: 'يسر أونلاين',
                  icon: AppAssets.yosr,
                  cubit: cubit,
                  index: 3),
              PaymentMethod(
                  dotIcon: true,
                  title: 'البطاقة المصرفية (أونلاين)',
                  icon: AppAssets.card,
                  cubit: cubit,
                  index: 4),
              PaymentMethod(
                  dotIcon: true,
                  title: 'ادفعلي',
                  icon: AppAssets.edf3ly,
                  cubit: cubit,
                  index: 5),
              PaymentMethod(
                  dotIcon: true,
                  title: 'موبي كاش',
                  icon: AppAssets.mobicash,
                  cubit: cubit,
                  index: 6),
              PaymentMethod(
                  dotIcon: true,
                  title: 'سداد',
                  icon: AppAssets.sdad,
                  cubit: cubit,
                  index: 7)
            ]);
          })),
      Container(
          decoration: BoxDecoration(color: AppColors.white, boxShadow: [
            BoxShadow(
                color: AppColors.black0.withAlpha(25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, -4))
          ]),
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
          child: CustomButton(onPressed: () {}, text: AppLocalizations.of(context)!.confirm))
    ]);
  }
}