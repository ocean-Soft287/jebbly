import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/core/service_locator/setup_get.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/core/widgets/custom_search_bar.dart';
import 'package:jeebly_mobile/features/home/restaurants/manager/restaurant_category_bloc/restaurant_category_bloc.dart';
import 'package:jeebly_mobile/features/home/restaurants/manager/restaurant_category_bloc/restaurant_category_event.dart';
import 'package:jeebly_mobile/features/home/restaurants/models/restaurant_category_model.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';
import 'package:dynamic_tabbar/dynamic_tabbar.dart';

class RestaurantSearch extends StatelessWidget {
  final String restaurantId;
  const RestaurantSearch({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<RestaurantCategoryBloc>()
        ..add(FetchRestaurantCategories(restaurantId: restaurantId)),
      child: Padding(
          padding: EdgeInsets.only(top: 11.h, right: 14.w, left: 14.w),
          child: Column(children: [
            CustomSearchBar(
                hint: AppLocalizations.of(context)!.search_for_your_fav_meal),
            Gap(16.h),
            BlocBuilder<RestaurantCategoryBloc, BaseState<RestaurantCategoryModel>>(
              builder: (context, state) {
                if (state.status == Status.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                final List<TabData> tabs = [
                  TabData(
                    index: 0,
                    title: Tab(text: AppLocalizations.of(context)!.all),
                    content: const SizedBox.shrink(),
                  ),
                  ...state.items.asMap().entries.map((entry) {
                    final index = entry.key + 1;
                    final category = entry.value;
                    return TabData(
                      index: index,
                      title: Tab(text: category.name),
                      content: const SizedBox.shrink(),
                    );
                  }),
                ];

                return SizedBox(
                    height: 50.h,
                    child: DynamicTabBarWidget(
                        dynamicTabs: tabs,
                        isScrollable: true,
                        onTabControllerUpdated: (controller) {},
                        onTap: (index) {
                          // TODO: Handle category filtering
                        },
                        onTabChanged: (index) {},
                        showBackIcon: false,
                        showNextIcon: false,
                        padding: EdgeInsets.zero,
                        indicatorColor: AppColors.primary,
                        automaticIndicatorColorAdjustment: true,
                        indicatorWeight: 2.h,
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 17.w),
                        labelStyle: Styles.textStyle16_500.copyWith(
                            color: AppColors.primary, fontFamily: 'Rubik'),
                        unselectedLabelStyle: Styles.textStyle16_500.copyWith(
                            fontFamily: 'Rubik')));
              },
            ),
            const CustomDivider()
          ])),
    );
  }
}