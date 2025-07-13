import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResendRow extends StatelessWidget {
  const ResendRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Gap(20.w),
      CustomText(AppLocalizations.of(context)!.no_code_was_sent,
          style: Styles.textStyle10_600),
      TextButton(
          onPressed: () {},
          child: CustomText(AppLocalizations.of(context)!.resend,
              style: Styles.textStyle10_600.copyWith(color: AppColors.primary)))
    ]);
  }
}