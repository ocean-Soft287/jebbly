import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/widgets/item_single_image_footer.dart';

class ItemSingleImage extends StatelessWidget {
  const ItemSingleImage(
      {super.key,
      required this.imageUrl,
      this.centerText,
      this.withFavIcon,
      this.available,
      required this.imageWidth,
      this.title,
      this.distance,
      required this.imageHeight,
      this.subtitle,
      this.deliveryPrice,
      this.totalRating,
      this.rateCount,
      this.fav,
      this.centered,
      this.type});
  final String imageUrl;
  final String? centerText,
      title,
      distance,
      subtitle,
      deliveryPrice,
      totalRating,
      rateCount,
      type;
  final bool? withFavIcon, available, fav, centered;
  final double imageWidth, imageHeight;

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return InkWell(
        onTap: () => type == 'category'
            ? GoRouter.of(context).push(RoutesNames.categories)
            : type == 'restaurant'? GoRouter.of(context)
            .push(RoutesNames.restaurantDetails):
        type == 'store'? GoRouter.of(context).push(RoutesNames.storeDetails):
        null,
        child: Column(
            crossAxisAlignment: centered == true
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: imageHeight,
                  child: Stack(children: [
                    Row(
                      children: [
                        CustomNetworkImage(
                            url: imageUrl,
                            width: imageWidth,
                            radius: 10.r,
                            height: imageHeight),
                      ],
                    ),
                    if (centerText != null) ...[
                      Container(
                          width: imageWidth,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.black0.withValues(alpha: .4))),
                      Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              width: imageWidth,
                              child: Padding(
                                padding: EdgeInsets.all(7.sp),
                                child: Text(centerText!,
                                    style: Styles.textStyle13_600
                                        .copyWith(color: AppColors.white),
                                    textAlign: TextAlign.center),
                              )))
                    ],
                    if (withFavIcon == true)
                      Positioned(
                          top: 7.h,
                          right: isArabic ? 12.w : null,
                          left: isArabic ? null : 12.w,
                          child: Icon(
                              fav == true
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: fav == true
                                  ? AppColors.primary
                                  : AppColors.white)),
                    if (available == true)
                      Positioned(
                          bottom: 10.h,
                          right: isArabic ? 8.w : null,
                          left: isArabic ? null : 8.w,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.red,
                                  borderRadius: BorderRadius.circular(5.r)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.w, vertical: 3.h),
                              child: Text(
                                  AppLocalizations.of(context)!
                                      .pickup_is_available,
                                  style: Styles.textStyle10_600
                                      .copyWith(color: AppColors.white))))
                  ])),
              ItemSingleImageFooter(
                  title: title,
                  distance: distance,
                  subtitle: subtitle,
                  deliveryPrice: deliveryPrice,
                  totalRating: totalRating,
                  rateCount: rateCount,
                  width: imageWidth)
            ]));
  }
}