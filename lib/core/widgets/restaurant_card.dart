import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/extensions/context_extension.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/flexible_image.dart';
import 'package:jeebly_mobile/core/widgets/item_single_image_footer.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';

import '../../features/home/restaurants/models/restaurant_model.dart';

const _baseUrl = 'https://jeebly.runasp.net';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.model,
    required this.imageWidth,
    required this.imageHeight,
  });

  final RestaurantModel model;
  final double imageWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    final isArabic = context.isArabic;

    // ── title: prefer name, fallback to owner ──────────────────────────────
    final title = isArabic ? model.nameOfResturantAr : model.nameOfResturantEn;

    // ── subtitle: prefer description, fallback to area ────────────────────
    final subtitle = isArabic
        ? ((model.descriptionAr?.isNotEmpty == true)
            ? model.descriptionAr
            : model.areaOfResturantAr)
        : ((model.descriptionEn?.isNotEmpty == true)
            ? model.descriptionEn
            : model.areaOfResturantEn);

    // ── image url ──────────────────────────────────────────────────────────
    final imageUrl = '$_baseUrl${model.logo}';

    final isAvailable = model.status == 'Active';

    return InkWell(
      onTap: () => context.push(RoutesNames.restaurantDetails,
          extra: model.id.toString()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ImageSection(
            imageUrl: imageUrl,
            imageWidth: imageWidth,
            imageHeight: imageHeight,
            isArabic: isArabic,
            isAvailable: isAvailable,
          ),
          ItemSingleImageFooter(
            title: title,
            distance: '1.3',
            // static — not in model yet
            subtitle: subtitle,
            deliveryPrice: '7.5',
            // static — not in model yet
            totalRating: model.rate.toString(),
            rateCount: '614',
            // static — not in model yet
            width: imageWidth,
          ),
        ],
      ),
    );
  }
}

// ─── image + overlays ────────────────────────────────────────────────────────

class _ImageSection extends StatelessWidget {
  const _ImageSection({
    required this.imageUrl,
    required this.imageWidth,
    required this.imageHeight,
    required this.isArabic,
    required this.isAvailable,
  });

  final String imageUrl;
  final double imageWidth;
  final double imageHeight;
  final bool isArabic;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: SizedBox(
        width: imageWidth,
        height: imageHeight,
        child: Stack(
          fit: StackFit.expand,
          children: [
            FlexibleImage(
              source: imageUrl,
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.cover,
            ),
            // ── fav icon ──────────────────────────────────────────────────
            Positioned(
              top: 7.h,
              left: isArabic ? null : 12.w,
              right: isArabic ? 12.w : null,
              child: const Icon(Icons.favorite_border, color: AppColors.white),
            ),
            // ── available badge ───────────────────────────────────────────
            if (isAvailable) _AvailableBadge(isArabic: isArabic),
          ],
        ),
      ),
    );
  }
}

// ─── "الاستلام متاح" badge ────────────────────────────────────────────────────

class _AvailableBadge extends StatelessWidget {
  const _AvailableBadge({required this.isArabic});

  final bool isArabic;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10.h,
      right: isArabic ? 8.w : null,
      left: isArabic ? null : 8.w,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(5.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
        child: Text(
          AppLocalizations.of(context)!.pickup_is_available,
          style: Styles.textStyle10_600.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
