import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/item_single_image.dart';

class NewRestaurants extends StatelessWidget {
  const NewRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(AppLocalizations.of(context)!.new_restaurant,
          style: Styles.textStyle15_600.copyWith(color: AppColors.black0)),
      Gap(12.h),
      SizedBox(
          height: 180.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12.h,
                      children: [
                        ItemSingleImage(type: 'restaurant',
                            imageUrl:
                                'https://images.ctfassets.net/trvmqu12jq2l/6FV4Opt7wUyR91t2FXyOIr/f32972fce10fc87585e831b334ea17ef/header.jpg?q=70&w=1208&h=1080&f=faces&fit=fill',
                            imageWidth: 352.w,
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
                      ]),
              separatorBuilder: (_, index) => Gap(12.w),
              itemCount: 10))
    ]);
  }
}