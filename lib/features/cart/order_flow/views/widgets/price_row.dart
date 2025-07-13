import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({super.key, required this.title, required this.price});
  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CustomText(title, style: Styles.textStyle16_500.copyWith(color: AppColors.black0)),
      if(title == AppLocalizations.of(context)!.app_commission) Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.grey2
        ),
        padding: EdgeInsets.all(8.sp),
        margin: EdgeInsetsDirectional.only(start: 12.w),
        child: CustomText('!', style: Styles.textStyle14_300.copyWith(color: AppColors.white))
      ),
      const Spacer(),
      CustomText(price == 0 ? AppLocalizations.of(context)!.free : '$price د.ل',
      style: Styles.textStyle16_500.copyWith(color: price == 0? AppColors.blue0:AppColors.black0))
    ]);
  }
}