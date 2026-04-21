import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/extensions/context_extension.dart';

import 'package:jeebly_mobile/core/widgets/flexible_image.dart';
import 'package:jeebly_mobile/core/widgets/item_single_image_footer.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';
import '../../../../../core/routing/routes_names.dart';
import '../../model/search_restaurant_model.dart';

class SearchRestaurantItem extends StatelessWidget {
  final SearchRestaurantModel restaurant;

  const SearchRestaurantItem({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    const String baseUrl = 'https://jeebly.runasp.net';
    final String imageUrl = restaurant.logo.startsWith('http')
        ? restaurant.logo
        : '$baseUrl${restaurant.logo}';

    final String title = context.isArabic ? restaurant.nameAr : restaurant.nameEn;

    return InkWell(
      onTap: () {
        context.push(RoutesNames.restaurantDetails, extra: restaurant.id);
      },
      child: Card(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: FlexibleImage(
                source: imageUrl,
                width: double.infinity,
                height: 120.h,
                fit: BoxFit.cover,
              ),
            ),


            ItemSingleImageFooter(
              title: title,
              subtitle: '${restaurant.minDeliveryTime}-${restaurant.maxDeliveryTime} ${AppLocalizations.of(context)!.min}',
              totalRating: restaurant.rating?.toString() ?? '0.0',
              width: double.infinity,

            ),
          ],
        ),
      ),
    );
  }
}
