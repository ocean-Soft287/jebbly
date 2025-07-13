import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/counter_box.dart';
import 'package:jeebly_mobile/core/widgets/custom_network_image.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';

class CategoryProduct extends StatelessWidget {
  const CategoryProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return InkWell(
        onTap: () =>
            GoRouter.of(context).push(RoutesNames.productDetails, extra: false),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            CustomNetworkImage(
                width: 107.w,
                height: 91.h,
                url:
                    'https://crossloop.co.in/cdn/shop/files/CrossloopBlissPodzTrueWirelessEarPods-Black1.jpg?v=1694279242'),
            Positioned(
                top: 4.h,
                left: isArabic ? null : 4.w,
                right: isArabic ? 4.w : null,
                child: Container(
                    padding: EdgeInsets.all(2.sp),
                    decoration: BoxDecoration(
                        color: AppColors.blue1,
                        borderRadius: BorderRadius.circular(3.r)),
                    child: CustomText('25%',
                        style: Styles.textStyle10_500.copyWith(
                            color: AppColors.blue0, fontSize: 7.sp)))),
            Positioned(
                bottom: 0,
                left: isArabic ? 0 : null,
                right: isArabic ? null : 0,
                child: CounterBox())
          ]),
          Row(children: [
            CustomText('60 د.ل',
                style: Styles.textStyle10_500.copyWith(
                    color: AppColors.grey1,
                    decoration: TextDecoration.lineThrough)),
            Gap(4.w),
            CustomText('51 د.ل',
                style: Styles.textStyle10_500.copyWith(color: AppColors.blue0))
          ]),
          CustomText('سماعة بلوتوث',
              style: Styles.textStyle10_500.copyWith(color: AppColors.grey1))
        ]));
  }
}