import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/core/bloc/paginated_bloc/paginated_bloc.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/item_single_image.dart';
import 'package:jeebly_mobile/core/widgets/pull_to_refresh.dart';
import 'package:jeebly_mobile/features/home/restaurants/manager/restaurannt_bloc/restaurant_bloc.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';

import '../../../home/restaurants/models/restaurant_model.dart';

class NewRestaurantsScreen extends StatelessWidget {
  const NewRestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.new_restaurant,
          style: Styles.textStyle15_600.copyWith(color: AppColors.black0),
        ),
        // adding back button with black color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black0),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: PullToRefresh(
          enableLoadMore: true,
          onRefresh: () async {
            context.read<RestaurantBloc>().add(const LoadFirstPage<RestaurantModel>());
          },
          onLoadMore: () async {
            context.read<RestaurantBloc>().add(const LoadNextPage<RestaurantModel>());
          },
          builder: (controller) {
            return BlocBuilder<RestaurantBloc, BaseState<RestaurantModel>>(
              builder: (context, state) {
                if (state.status == Status.loading && state.items.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.status == Status.failure && state.items.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          state.errorMessage ?? 'Failed to load restaurants',
                          style: TextStyle(fontSize: 16.sp, color: Colors.red),
                        ),
                        Gap(10.h),
                        ElevatedButton(
                          onPressed: () {
                            context.read<RestaurantBloc>().add(const LoadFirstPage<RestaurantModel>());
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                final double width = MediaQuery.of(context).size.width;
                return SingleChildScrollView(
                  controller: controller,
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                  child: Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.items.length,
                        separatorBuilder: (_, __) => Gap(12.h),
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          return ItemSingleImage(
                            type: 'restaurant',
                            imageUrl: (item.logo != null && item.logo!.isNotEmpty)
                                ? 'https://jeebly.runasp.net${item.logo}'
                                : '',
                            imageWidth: width - 24.w,
                            imageHeight: 120.h,
                            withFavIcon: true,
                            available: item.status == 'Active',
                            centered: true,
                            title: Localizations.localeOf(context).languageCode == 'ar'
                                ? (item.nameOfResturantAr?.isNotEmpty == true
                                    ? item.nameOfResturantAr
                                    : item.nameOfResturantOwner)
                                : (item.nameOfResturantEn?.isNotEmpty == true
                                    ? item.nameOfResturantEn
                                    : item.nameOfResturantOwner),
                            distance: '1.3',
                            subtitle: Localizations.localeOf(context).languageCode == 'ar'
                                ? (item.descriptionAr?.isNotEmpty == true
                                    ? item.descriptionAr
                                    : item.areaOfResturantAr)
                                : (item.descriptionEn?.isNotEmpty == true
                                    ? item.descriptionEn
                                    : item.areaOfResturantEn),
                            deliveryPrice: '7.5',
                            totalRating: item.rate.toString(),
                            rateCount: '614',
                          );
                        },
                      ),
                      if (state.status == Status.isLoadingMore)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: const Center(child: CircularProgressIndicator()),
                        ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
