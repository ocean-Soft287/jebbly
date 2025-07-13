import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/widgets/item_single_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/item.dart';

class UniqueRestaurants extends StatelessWidget {
  const UniqueRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Item(
        withFooter: true,
        title: AppLocalizations.of(context)!.unique_restaurants_like_you,
        imageHeight: 105.h,
        itemImages: [
          ItemSingleImage(type: 'restaurant',
              imageHeight: 105.h,
              imageUrl:
              'https://cdn.prod.website-files.com/60414b21f1ffcdbb0d5ad688/65206c769c62b75fd6fd0c67_alex-haney-CAhjZmVk5H4-unsplash.jpg',
              imageWidth: 207.w,
              withFavIcon: true,
              available: true,
              title: 'ريبوسو كافي - طريق الشوك',
              distance: '1.3',
              subtitle: 'إفطار صباحي و عصائر طبيعية',
              deliveryPrice: '7.5',
              totalRating: '4.1',
              rateCount: '614'),
          ItemSingleImage(type: 'restaurant',
              imageHeight: 105.h,
              imageUrl:
              'https://aqaryamasr.com/blog/wp-content/uploads/2022/08/%D9%85%D8%B7%D8%A7%D8%B9%D9%85-%D8%B9%D8%A7%D8%A6%D9%84%D9%8A%D8%A9-%D9%81%D9%8A-%D8%A7%D9%84%D8%B1%D9%8A%D8%A7%D8%B6-780x470-1.jpg',
              imageWidth: 207.w,
              withFavIcon: true,
              available: true,
              title: 'ريبوسو كافي - طريق الشوك',
              distance: '1.3',
              subtitle: 'إفطار صباحي و عصائر طبيعية',
              deliveryPrice: '7.5',
              totalRating: '4.1',
              rateCount: '614'),
          ItemSingleImage(type: 'restaurant',
              imageHeight: 105.h,
              imageUrl:
              'https://cdn.prod.website-files.com/60414b21f1ffcdbb0d5ad688/65206c769c62b75fd6fd0c67_alex-haney-CAhjZmVk5H4-unsplash.jpg',
              imageWidth: 207.w,
              withFavIcon: true,
              available: true,
              title: 'ريبوسو كافي - طريق الشوك',
              distance: '1.3',
              subtitle: 'إفطار صباحي و عصائر طبيعية',
              deliveryPrice: '7.5',
              totalRating: '4.1',
              rateCount: '614'),
          ItemSingleImage(type: 'restaurant',
              imageHeight: 105.h,
              imageUrl:
              'https://cdn.prod.website-files.com/60414b21f1ffcdbb0d5ad688/65206c769c62b75fd6fd0c67_alex-haney-CAhjZmVk5H4-unsplash.jpg',
              imageWidth: 207.w,
              withFavIcon: true,
              available: true,
              title: 'ريبوسو كافي - طريق الشوك',
              distance: '1.3',
              subtitle: 'إفطار صباحي و عصائر طبيعية',
              deliveryPrice: '7.5',
              totalRating: '4.1',
              rateCount: '614'),
          ItemSingleImage(type: 'restaurant',
              imageHeight: 105.h,
              imageUrl:
              'https://cdn.prod.website-files.com/60414b21f1ffcdbb0d5ad688/65206c769c62b75fd6fd0c67_alex-haney-CAhjZmVk5H4-unsplash.jpg',
              imageWidth: 207.w,
              withFavIcon: true,
              available: true,
              title: 'ريبوسو كافي - طريق الشوك',
              distance: '1.3',
              subtitle: 'إفطار صباحي و عصائر طبيعية',
              deliveryPrice: '7.5',
              totalRating: '4.1',
              rateCount: '614')
        ]);
  }
}
