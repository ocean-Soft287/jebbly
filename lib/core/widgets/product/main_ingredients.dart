import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/widgets/product/single_ingredient.dart';

class MainIngredients extends StatelessWidget {
  const MainIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.white,
        width: double.infinity,
        padding: EdgeInsets.all(16.sp),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(AppLocalizations.of(context)!.main_ingredients,
              style: Styles.textStyle16_500.copyWith(color: AppColors.black0)),
          Wrap(children: [
            SingleIngredient(title: 'عصير'),
            SingleIngredient(title: 'سكر')
          ])
        ]));
  }
}