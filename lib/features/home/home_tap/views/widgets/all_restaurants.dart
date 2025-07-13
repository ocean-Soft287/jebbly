import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';
import 'package:jeebly_mobile/core/widgets/item_single_image.dart';

class AllRestaurants extends StatelessWidget {
  const AllRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      spacing: 12.h,
        children: [
      Row(children: [
        Text(AppLocalizations.of(context)!.all_restaurants,
            style: Styles.textStyle15_600.copyWith(color: AppColors.black0)),
        const Spacer(),
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey1),
                borderRadius: BorderRadius.circular(20.r)),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            child: CustomSVG(assetName: AppAssets.filter)),
        Gap(10.w)
      ]),
      ItemSingleImage(type: 'restaurant',
          imageUrl:
              'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg',
          imageWidth: width - 20.w,
          imageHeight: 120.h,
          withFavIcon: true,
          available: true,
          centered: true,
          title: 'ريبوسو كافي - طريق الشوك',
          distance: '1.3',
          subtitle: 'إفطار صباحي و عصائر طبيعية',
          deliveryPrice: '7.5',
          totalRating: '4.1',
          rateCount: '614'),
      ItemSingleImage(type: 'restaurant',
          imageUrl:
              'https://www.storehub.com/ph/wp-content/uploads/sites/3/2024/05/StoreHub-MY-Blog-Ultimate-Guide-to-Starting-a-Restaurant-Featured-Image.jpg',
          imageWidth: width - 20.w,
          imageHeight: 120.h,
          withFavIcon: true,
          available: true,
          centered: true,
          title: 'ريبوسو كافي - طريق الشوك',
          distance: '1.3',
          subtitle: 'إفطار صباحي و عصائر طبيعية',
          deliveryPrice: '7.5',
          totalRating: '4.1',
          rateCount: '614'),
      ItemSingleImage(type: 'restaurant',
          imageUrl:
              'https://studiocph.dk/wp-content/uploads/2024/07/Restaurant-STUDIO-Michelin-anbefalet-nordisk-koekken.jpg',
          imageWidth: width - 20.w,
          imageHeight: 120.h,
          withFavIcon: true,
          available: true,
          centered: true,
          title: 'ريبوسو كافي - طريق الشوك',
          distance: '1.3',
          subtitle: 'إفطار صباحي و عصائر طبيعية',
          deliveryPrice: '7.5',
          totalRating: '4.1',
          rateCount: '614')
    ]);
  }
}