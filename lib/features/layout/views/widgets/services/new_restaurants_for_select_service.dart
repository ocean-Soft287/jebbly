import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/core/bloc/paginated_bloc/paginated_bloc.dart';
import 'package:jeebly_mobile/features/home/restaurants/manager/restaurannt_bloc/restaurant_bloc.dart';

import '../../../../../core/widgets/restaurant_card.dart';
import '../../../../home/restaurants/models/restaurant_model.dart';

class NewRestaurantsForSelectService extends StatefulWidget {
  const NewRestaurantsForSelectService({super.key});

  @override
  State<NewRestaurantsForSelectService> createState() => _NewRestaurantsForSelectServiceState();
}

class _NewRestaurantsForSelectServiceState extends State<NewRestaurantsForSelectService> {
  @override
  void initState() {
    super.initState();
    // Load first page without pagination
    context.read<RestaurantBloc>().add(const LoadFirstPage<RestaurantModel>());
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Text(AppLocalizations.of(context)!.new_restaurant,
              style: Styles.textStyle15_600.copyWith(color: AppColors.black0)),
          const Spacer(),
          GestureDetector(
            onTap: () => GoRouter.of(context).push(RoutesNames.newRestaurants),
            child: Text(
              Localizations.localeOf(context).languageCode == 'ar' ? 'عرض الكل' : 'See all',
              style: Styles.textHeading14.copyWith(color: AppColors.primary),
            ),
          ),
        ],
      ),
      Gap(12.h),
      BlocBuilder<RestaurantBloc, BaseState<RestaurantModel>>(
        builder: (context, state) {
          if (state.status == Status.loading && state.items.isEmpty) {
            return SizedBox(
              height: screenHeight * 0.27,
              child: const Center(child: CircularProgressIndicator()),
            );
          }

          if (state.status == Status.failure && state.items.isEmpty) {
            return SizedBox(
              height: screenHeight * 0.27,
              child: Center(
                child: Text(state.errorMessage ?? 'Failed to load restaurants'),
              ),
            );
          }

          // Limit to 10 items - no pagination on this screen
          final limitedItems = state.items.take(10).toList();

          return SizedBox(
            height: screenHeight * 0.27,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                final item = limitedItems[index];
                return RestaurantCard(
                  model: item,
                  imageWidth: 352.w,
                  imageHeight: 120.h,
                );
                //   ItemSingleImage(
                //   type: 'restaurant',
                //   imageUrl: (item.logo != null && item.logo!.isNotEmpty)
                //       ? 'https://jeebly.runasp.net${item.logo}'
                //       : '',
                //   imageWidth: 352.w,
                //   imageHeight: 120.h,
                //   withFavIcon: true,
                //   available: item.status == 'Active',
                //   centered: true,
                //   title: Localizations.localeOf(context).languageCode == 'ar'
                //       ? (item.nameOfResturantAr?.isNotEmpty == true
                //           ? item.nameOfResturantAr ?? ''
                //           : item.nameOfResturantOwner ?? '')
                //       : (item.nameOfResturantEn?.isNotEmpty == true
                //           ? item.nameOfResturantEn ?? ''
                //           : item.nameOfResturantOwner ?? ''),
                //   distance: '1.3',
                //   subtitle: Localizations.localeOf(context).languageCode == 'ar'
                //       ? (item.descriptionAr?.isNotEmpty == true
                //           ? item.descriptionAr ?? ''
                //           : item.areaOfResturantAr ?? '')
                //       : (item.descriptionEn?.isNotEmpty == true
                //           ? item.descriptionEn ?? ''
                //           : item.areaOfResturantEn ?? ''),
                //   deliveryPrice: '7.5',
                //   totalRating: item.rate.toString(),
                //   rateCount: '614',
                // );
              },
              separatorBuilder: (_, index) => Gap(12.w),
              itemCount: limitedItems.length,
            ),
          );
        },
      )
    ]);
  }
}