import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/layout/drawer_app_bar.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/layout/drawer_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LayoutDrawer extends StatelessWidget {
  const LayoutDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<Widget> items = [
      DrawerItem(
          selected: true,
          selectIcon: AppAssets.home,
          unSelectIcon: AppAssets.home,
          title: AppLocalizations.of(context)!.home_ii),
      DrawerItem(
          onTap: () => GoRouter.of(context).push(RoutesNames.layout, extra: 0),
          selectIcon: AppAssets.pizza,
          unSelectIcon: AppAssets.pizza,
          title: AppLocalizations.of(context)!.jeebly_eat),
      DrawerItem(
          onTap: () => GoRouter.of(context).push(RoutesNames.layout, extra: 1),
          selectIcon: AppAssets.iceCream,
          unSelectIcon: AppAssets.iceCream,
          title: AppLocalizations.of(context)!.jeebly_get),
      DrawerItem(
          onTap: () => GoRouter.of(context).push(RoutesNames.layout, extra: 2),
          selectIcon: AppAssets.soda,
          unSelectIcon: AppAssets.soda,
          title: AppLocalizations.of(context)!.jeebly_shop),
      CustomDivider(),
      DrawerItem(
          selectIcon: AppAssets.inbox,
          unSelectIcon: AppAssets.inbox,
          title: AppLocalizations.of(context)!.my_wallet,
      location: RoutesNames.myWallet),
      DrawerItem(
          selectIcon: AppAssets.location,
          unSelectIcon: AppAssets.location,
          title: AppLocalizations.of(context)!.my_addresses,
          location: RoutesNames.addresses),
      DrawerItem(
          selectIcon: AppAssets.chrome,
          unSelectIcon: AppAssets.chrome,
          title: AppLocalizations.of(context)!.acc_and_settings,
          location: RoutesNames.account),
      DrawerItem(
          selectIcon: AppAssets.award,
          unSelectIcon: AppAssets.award,
          title: AppLocalizations.of(context)!.terms_and_conditions,
      location: RoutesNames.termsAndConditions),
      DrawerItem(
          selectIcon: AppAssets.phoneGrey,
          unSelectIcon: AppAssets.phoneGrey,
          title: AppLocalizations.of(context)!.call_cs)
    ];

    return SizedBox(
        width: width * .53,
        child: Scaffold(
            backgroundColor: AppColors.white,
            body: Column(children: [
              const DrawerAppBar(),
              Expanded(
                  child: ListView.separated(
                      padding: EdgeInsets.all(6.sp),
                      itemBuilder: (_, index) => items[index],
                      separatorBuilder: (_, index) => Gap(8.h),
                      itemCount: items.length))
            ])));
  }
}
