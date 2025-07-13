import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key, this.title, this.onPressed, this.withMinimumOrder});
  final String? title;
  final void Function()? onPressed;
  final bool? withMinimumOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 4.h),
        decoration: BoxDecoration(color: AppColors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: .3), // Shadow color
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, -4))
        ]),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          if(withMinimumOrder == true) ...[CustomText('${AppLocalizations.of(context)!.minimum_order}: 20 د.ل',
              style: Styles.textStyle16_500),
          Gap(10.h)],
          CustomButton(
              onPressed: onPressed ?? () {},
              text: title ?? AppLocalizations.of(context)!.show_cart,
              prefixIcon: CustomText('1',
                  style:
                      Styles.textStyle13_500.copyWith(color: AppColors.white)),
              suffixIcon: Text('25 د.ل',
                  style:
                      Styles.textStyle16_500.copyWith(color: AppColors.white)))
        ]));
  }
}