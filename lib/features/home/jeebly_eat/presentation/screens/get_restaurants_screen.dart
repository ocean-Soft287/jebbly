import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/core/service_locator/setup_get.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/core/widgets/custom_search_bar.dart';
import 'package:jeebly_mobile/features/home/jeebly_eat/manager/category_restaurants_bloc/category_restaurants_bloc.dart';
import 'package:jeebly_mobile/features/home/jeebly_eat/manager/category_restaurants_bloc/category_restaurants_event.dart';
import 'package:jeebly_mobile/features/home/jeebly_eat/model/category_rastaurants_model.dart';
import 'package:jeebly_mobile/features/home/jeebly_eat/presentation/widgets/category_restaurants_grid.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/layout/layout_app_bar.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/layout/layout_drawer.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';

class EatRestaurantsScreen extends StatelessWidget {
  final String categoryId;

  const EatRestaurantsScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CategoryRestaurantsBloc>()
        ..add(GetRestaurantsByCategoryEvent(categoryId)),
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: const LayoutAppBar(),
          drawer: const LayoutDrawer(),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomSearchBar(
                hint: AppLocalizations.of(context)!
                    .search_for_restaurant_or_item),
            const CustomDivider(),
            Expanded(
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 12.h),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  AppLocalizations.of(context)!
                                      .browse_restaurants,
                                  style: Styles.textStyle15_600
                                      .copyWith(color: AppColors.black0)),
                              BlocBuilder<CategoryRestaurantsBloc,
                                  BaseState<CategoryRestaurantsModel>>(
                                builder: (context, state) {
                                  if (state.status == Status.loading) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (state.status == Status.success) {
                                    return CategoryRestaurantsGrid(
                                        restaurants: state.items);
                                  } else if (state.status == Status.failure) {
                                    return Center(
                                        child: Text(
                                            state.errorMessage ?? 'Error'));
                                  }
                                  return const SizedBox.shrink();
                                },
                              )
                            ]))))
          ])),
    );
  }
}
