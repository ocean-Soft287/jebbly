import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/extensions/context_extension.dart';
import 'package:jeebly_mobile/core/widgets/flexible_image.dart';
import 'package:jeebly_mobile/core/widgets/item_single_image_footer.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';
import '../../../../../core/routing/routes_names.dart';
import '../../model/category_rastaurants_model.dart';

class CategoryRestaurantsItem extends StatelessWidget {
  final CategoryRestaurantsModel restaurant;

  const CategoryRestaurantsItem({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    const String baseUrl = 'https://jebbly.runasp.net';
    final String imageUrl = restaurant.logo.startsWith('http')
        ? restaurant.logo
        : '$baseUrl${restaurant.logo}';

    final String title = context.isArabic ? restaurant.nameAr : restaurant.nameEn;

    return InkWell(
      onTap: () {
        context.push(RoutesNames.restaurantDetails, extra: restaurant.id);
      },
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
                child: FlexibleImage(
                  source: imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: ItemSingleImageFooter(
                title: title,
                subtitle: '${restaurant.minDeliveryTime?.toInt() ?? 0}-${restaurant.maxDeliveryTime?.toInt() ?? 0} ${AppLocalizations.of(context)!.min}',
                totalRating: restaurant.rating?.toString() ?? '0.0',
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}