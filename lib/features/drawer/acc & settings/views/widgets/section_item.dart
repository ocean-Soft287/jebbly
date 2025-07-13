import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SectionItem extends StatelessWidget {
  const SectionItem(
      {super.key, required this.icon, required this.itemName, this.lang, this.onTap});
  final String icon, itemName;
  final bool? lang;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r), color: AppColors.white),
          padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 12.h),
          child: Row(children: [
            CustomSVG(assetName: icon),
            Gap(8.w),
            Text(itemName, style: Styles.textStyle16_300.copyWith(
              color: itemName == AppLocalizations.of(context)!.logout? AppColors.primary: null
            )),
            if(lang == true) ...[
              const Spacer(),
              Text(isArabic? 'العربية': 'English', style: Styles.textStyle16_300)
            ]
          ])),
    );
  }
}