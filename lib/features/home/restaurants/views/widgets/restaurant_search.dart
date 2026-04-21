import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/service_locator/setup_get.dart';
import 'package:jeebly_mobile/core/widgets/custom_search_bar.dart';
import 'package:jeebly_mobile/features/home/restaurants/manager/restaurant_category_bloc/restaurant_category_bloc.dart';
import 'package:jeebly_mobile/features/home/restaurants/manager/restaurant_category_bloc/restaurant_category_event.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';

class RestaurantSearch extends StatelessWidget {
  final int restaurantId;
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
            Gap(8.h),

          ])),
    );
  }
}