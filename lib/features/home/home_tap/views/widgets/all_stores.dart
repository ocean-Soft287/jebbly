import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/core/widgets/item_single_image.dart';

class AllStores extends StatelessWidget {
  const AllStores({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12.h,
        children: [
          Text(AppLocalizations.of(context)!.all_stores,
              style: Styles.textStyle15_600.copyWith(color: AppColors.black0)),
          ItemSingleImage(
            type: 'store',
              imageUrl:
              'https://www.onlyoakfurniture.co.uk/wp-content/uploads/2025/01/OOF-Winter-Sale-1.png',
              imageWidth: width - 40.w,
              imageHeight: 111.h,
              withFavIcon: true,
              centered: true,
              title: 'معرض للأثاث المنزلي الحديث و الكلاسيك',
              distance: '0.3',
              subtitle: 'جميع أنواع الأثاث',
              deliveryPrice: '0',
              totalRating: '4.1',
              rateCount: '614'),
          CustomDivider(),
          ItemSingleImage(
              type: 'store',
              imageUrl:
              'https://wps03-media.cdn.ihealthspot.com/wp-content/uploads/sites/13/2024/05/Comprehensive-Care-Clinic-Palm-Primary-Care-Dallas-and-Fort-Worth-1024x683.jpg',
              imageWidth: width - 40.w,
              imageHeight: 111.h,
              withFavIcon: true,
              centered: true,
              title: 'عيادة العامري للأم و الطفل',
              distance: '0.3',
              subtitle: 'عيادة',
              deliveryPrice: '0',
              totalRating: '4.1',
              rateCount: '614'),
          CustomDivider(),
          ItemSingleImage(
              type: 'store',
              imageUrl:
              'https://www.onlyoakfurniture.co.uk/wp-content/uploads/2025/01/OOF-Winter-Sale-1.png',
              imageWidth: width - 40.w,
              imageHeight: 111.h,
              withFavIcon: true,
              centered: true,
              title: 'معرض للأثاث المنزلي الحديث و الكلاسيك',
              distance: '0.3',
              subtitle: 'جميع أنواع الأثاث',
              deliveryPrice: '0',
              totalRating: '4.1',
              rateCount: '614')
        ]);
  }
}