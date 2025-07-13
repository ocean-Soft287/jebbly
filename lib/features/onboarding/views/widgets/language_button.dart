import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';
import 'package:jeebly_mobile/features/onboarding/views/widgets/language_dialog.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
        child: CustomButton(
            backgroundColor: AppColors.white,
            onPressed: () => showDialog(context: context, builder: (_) => LanguageDialog()),
            text: AppLocalizations.of(context)!.lang,
            margin: EdgeInsetsDirectional.only(start: 11.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
            textStyle: Styles.textStyle18.copyWith(fontWeight: FontWeight.w500),
            prefixIcon: CustomSVG(assetName: AppAssets.lang),
            suffixIcon: CustomSVG(assetName: AppAssets.arrowDown)));
  }
}