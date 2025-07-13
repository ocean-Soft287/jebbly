import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/core/widgets/item_single_image.dart';

class CategoryResultsList extends StatelessWidget {
  const CategoryResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<ItemSingleImage> results = [
      ItemSingleImage(
        centered: true,
          imageUrl:
              'https://www.theworlds50best.com/mena/en/filestore/jpg/MENA25-TheList-Banner.jpg',
          imageWidth: width - 47.w,
          imageHeight: 120.h,
      title: 'ريوسو كافي - طريق الشوك',
        distance: '1.3',
        subtitle: 'إفطار صباحي و عصائر طبيعية',
        deliveryPrice: '7.5',
        totalRating: '4.1',
        rateCount: '614'
      ),
      ItemSingleImage(
        centered: true,
          imageUrl:
              'https://www.theworlds50best.com/mena/en/filestore/jpg/MENA25-TheList-Banner.jpg',
          imageWidth: width - 47.w,
          imageHeight: 120.h,
      title: 'ريوسو كافي - طريق الشوك',
        distance: '1.3',
        subtitle: 'إفطار صباحي و عصائر طبيعية',
        deliveryPrice: '7.5',
        totalRating: '4.1',
        rateCount: '614'
      ),
      ItemSingleImage(
        centered: true,
          imageUrl:
              'https://www.theworlds50best.com/mena/en/filestore/jpg/MENA25-TheList-Banner.jpg',
          imageWidth: width - 47.w,
          imageHeight: 120.h,
      title: 'ريوسو كافي - طريق الشوك',
        distance: '1.3',
        subtitle: 'إفطار صباحي و عصائر طبيعية',
        deliveryPrice: '7.5',
        totalRating: '4.1',
        rateCount: '614'
      ),
      ItemSingleImage(
        centered: true,
          imageUrl:
              'https://www.theworlds50best.com/mena/en/filestore/jpg/MENA25-TheList-Banner.jpg',
          imageWidth: width - 47.w,
          imageHeight: 120.h,
      title: 'ريوسو كافي - طريق الشوك',
        distance: '1.3',
        subtitle: 'إفطار صباحي و عصائر طبيعية',
        deliveryPrice: '7.5',
        totalRating: '4.1',
        rateCount: '614'
      ),
      ItemSingleImage(
        centered: true,
          imageUrl:
              'https://www.theworlds50best.com/mena/en/filestore/jpg/MENA25-TheList-Banner.jpg',
          imageWidth: width - 47.w,
          imageHeight: 120.h,
      title: 'ريوسو كافي - طريق الشوك',
        distance: '1.3',
        subtitle: 'إفطار صباحي و عصائر طبيعية',
        deliveryPrice: '7.5',
        totalRating: '4.1',
        rateCount: '614'
      ),
      ItemSingleImage(
        centered: true,
          imageUrl:
              'https://www.theworlds50best.com/mena/en/filestore/jpg/MENA25-TheList-Banner.jpg',
          imageWidth: width - 47.w,
          imageHeight: 120.h,
      title: 'ريوسو كافي - طريق الشوك',
        distance: '1.3',
        subtitle: 'إفطار صباحي و عصائر طبيعية',
        deliveryPrice: '7.5',
        totalRating: '4.1',
        rateCount: '614'
      ),
      ItemSingleImage(
        centered: true,
          imageUrl:
              'https://www.theworlds50best.com/mena/en/filestore/jpg/MENA25-TheList-Banner.jpg',
          imageWidth: width - 47.w,
          imageHeight: 120.h,
      title: 'ريوسو كافي - طريق الشوك',
        distance: '1.3',
        subtitle: 'إفطار صباحي و عصائر طبيعية',
        deliveryPrice: '7.5',
        totalRating: '4.1',
        rateCount: '614'
      )
    ];
    return Expanded(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
            itemBuilder: (_, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: results[index]),
            separatorBuilder: (_, index) => CustomDivider(
              height: 20.h
            ),
            itemCount: results.length));
  }
}