import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StoreName extends StatelessWidget {
  const StoreName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomText(AppLocalizations.of(context)!.your_order_from,
                style: Styles.textStyle13_500.copyWith(color: AppColors.grey1)),
            CustomText('مقهى و مطع لارمبلا - الحياة مول',
                style: Styles.textStyle16_500.copyWith(color: AppColors.black0))
          ]),
          IntrinsicWidth(
              child: CustomButton(
                  borderRadius: 5.r,
                  height: 24.h,
                  backgroundColor: AppColors.ketchup2,
                  onPressed: () {},
                  text: AppLocalizations.of(context)!.add_element,
                  textStyle:
                      Styles.textStyle10_500.copyWith(color: AppColors.primary),
                  prefixIcon:
                      Icon(Icons.add, color: AppColors.primary, size: 17.sp),
                  withSpacer: false))
        ]));
  }
}