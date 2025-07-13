import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/core/widgets/custom_search_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dynamic_tabbar/dynamic_tabbar.dart';

class RestaurantSearch extends StatelessWidget {
  const RestaurantSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 11.h, right: 14.w, left: 14.w),
        child: Column(children: [
          CustomSearchBar(
              hint: AppLocalizations.of(context)!.search_for_your_fav_meal),
          Gap(16.h),
          SizedBox(
              height: 50.h,
              child: DynamicTabBarWidget(
                  dynamicTabs: [
                    TabData(
                        index: 0,
                        title: Tab(text: AppLocalizations.of(context)!.all),
                        content: SizedBox.shrink()),
                    TabData(
                        index: 1,
                        title: Tab(text: 'مثلجات'),
                        content: SizedBox.shrink()),
                    TabData(
                        index: 2,
                        title: Tab(text: 'عصائر طبيعية'),
                        content: SizedBox.shrink()),
                    TabData(
                        index: 3,
                        title: Tab(text: 'حلويات غربية'),
                        content: SizedBox.shrink())
                  ],
                  isScrollable: true,
                  onTabControllerUpdated: (controller) {},
                  onTap: (index) {},
                  onTabChanged: (index) {},
                  showBackIcon: false,
                  showNextIcon: false,
                  padding: EdgeInsets.zero,
                  indicatorColor: AppColors.primary,
                  automaticIndicatorColorAdjustment: true,
                  indicatorWeight: 2.h,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 17.w),
                  labelStyle:
                      Styles.textStyle16_500.copyWith(color: AppColors.primary),
                  unselectedLabelStyle: Styles.textStyle16_500)),
          const CustomDivider()
        ]));
  }
}