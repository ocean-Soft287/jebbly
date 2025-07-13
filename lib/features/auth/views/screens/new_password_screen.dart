import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/new_password_form.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/password_reset_confirm_button.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(AppLocalizations.of(context)!.new_password,
            style: Styles.textStyle24_600),
            Gap(42.h),
            const NewPasswordForm(),
            Gap(38.h),
            const PasswordResetConfirmButton()
          ]
        ),
      )
    );
  }
}
