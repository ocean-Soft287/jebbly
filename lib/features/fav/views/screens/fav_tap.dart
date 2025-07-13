import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/core/widgets/item_single_image.dart';

class FavTap extends StatelessWidget {
  const FavTap({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<Widget> favList = [
      Text(AppLocalizations.of(context)!.fav_stores,
          style: Styles.textStyle15_600.copyWith(color: AppColors.black0)),
      ItemSingleImage(
          imageUrl:
              'https://images.ctfassets.net/trvmqu12jq2l/6FV4Opt7wUyR91t2FXyOIr/f32972fce10fc87585e831b334ea17ef/header.jpg?q=70&w=1208&h=1080&f=faces&fit=fill',
          imageWidth: width - 40.w,
          imageHeight: 120.h,
          title: 'ريبوسو كافي - طريق الشوك',
          distance: '1.3',
          subtitle: 'إفطار صباحي و عصائر طبيعية',
          withFavIcon: true,
          available: true,
          fav: true,
          centered: true),
      ItemSingleImage(
          imageUrl:
              'https://www.criteo.com/wp-content/uploads/2024/07/What-is-In-Store-Advertising-scaled.jpeg',
          imageWidth: width - 40.w,
          imageHeight: 120.h,
          title: 'معرض للأثاث المنزلي الحديث و الكلاسيك',
          distance: '0.3',
          subtitle: 'جميع أنواع الأثاث',
          withFavIcon: true,
          deliveryPrice: '0',
          rateCount: '614',
          totalRating: '4.1',
          fav: true,
          centered: true)
    ];
    return Scaffold(
        body: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            itemBuilder: (_, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: favList[index]),
            separatorBuilder: (_, index) =>
                index == 0 ? Gap(20.h) : CustomDivider(height: 20.h),
            itemCount: favList.length));
  }
}