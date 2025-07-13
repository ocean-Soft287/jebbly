import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AvailableCredit extends StatelessWidget {
  const AvailableCredit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.all(14.sp),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomText(AppLocalizations.of(context)!.credit_available_for_usage,
            style: Styles.textStyle10_300),
        CustomText('0 د.ل'),
        CustomButton(
            onPressed: () {},
            text: AppLocalizations.of(context)!.charge_wallet)
      ])
    );
  }
}
