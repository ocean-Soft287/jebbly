import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';

class WalletToggleTaps extends StatelessWidget {
  const WalletToggleTaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
            height: 48.h,
            color: AppColors.white,
            child: DynamicTabBarWidget(
                dynamicTabs: [
                  TabData(
                      index: 0,
                      title: Tab(
                          text: AppLocalizations.of(context)!.wallet_history),
                      content: SizedBox.shrink()),
                  TabData(
                      index: 1,
                      title: Tab(
                          text:
                              AppLocalizations.of(context)!.my_payment_methods),
                      content: SizedBox.shrink())
                ],
                onTabControllerUpdated: (controller) {},
                onTap: (index) {},
                onTabChanged: (index) {},
                showBackIcon: false,
                showNextIcon: false,
                padding: EdgeInsets.zero,
                indicatorColor: AppColors.primary,
                automaticIndicatorColorAdjustment: true,
                indicatorWeight: 2.h,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 40.w),
                labelStyle:
                    Styles.textStyle16_500.copyWith(color: AppColors.primary),
                unselectedLabelStyle: Styles.textStyle16_500)));
  }
}