import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/core/bloc/paginated_bloc/paginated_bloc.dart';
import 'package:jeebly_mobile/core/extensions/context_extension.dart';
import 'package:jeebly_mobile/core/widgets/item_single_image.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/item.dart';
import '../../manager/high_rated_restaurants_bloc/high_rated_restaurants_bloc.dart';
import '../../model/search_restaurant_model.dart';

class HighRatedRestaurants extends StatefulWidget {
  const HighRatedRestaurants({super.key});

  @override
  State<HighRatedRestaurants> createState() => _HighRatedRestaurantsState();
}

class _HighRatedRestaurantsState extends State<HighRatedRestaurants> {
  @override
  void initState() {
    super.initState();
    context.read<HighRatedRestaurantsBloc>().add(const LoadFirstPage<SearchRestaurantModel>());
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighRatedRestaurantsBloc, BaseState<SearchRestaurantModel>>(
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.items.isEmpty) {
          return const SizedBox.shrink();
        }

        const String baseUrl = 'https://jeebly.runasp.net';

        return Item(
          withFooter: true,
          title: AppLocalizations.of(context)!.high_rated_restaurants,
          imageHeight: 105.h,
          itemImages: state.items.map((restaurant) {
            final String imageUrl = '$baseUrl${restaurant.logo}';

            final String title = context.isArabic ? restaurant.nameAr : restaurant.nameEn;

            return ItemSingleImage(
              restaurantId: restaurant.id,
              type: 'restaurant',
              imageHeight: 105.h,
              imageUrl: imageUrl,
              imageWidth: 207.w,
              withFavIcon: true,
              available: true,
              title: title,
              distance: '1.3', // Placeholder as it's not in the model
              subtitle: '${restaurant.minDeliveryTime}-${restaurant.maxDeliveryTime} ${AppLocalizations.of(context)!.min}',
              deliveryPrice: '7.5', // Placeholder as it's not in the model
              totalRating: restaurant.rating?.toString() ?? '0.0',
              rateCount: '614', // Placeholder as it's not in the model
            );
          }).toList(),
        );
      },
    );
  }
}
