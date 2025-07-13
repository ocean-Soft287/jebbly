import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/confirm_code_button.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/otp_fields.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/resend_row.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: const CustomAppBar(),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomText(AppLocalizations.of(context)!.confirmation_code,
                  style: Styles.textStyle24_600),
              Gap(42.h),
              const OtpFields(),
              Gap(20.h),
              const ResendRow(),
              Gap(72.h),
              const ConfirmCodeButton()
            ])));
  }
}