import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_cubit.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/password_form.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/password_logo.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AccountCubit.get(context);
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
            child: Column(children: [
          Row(children: [BackButton()]),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              child: Column(children: [
                const PasswordLogo(),
                Gap(59.h),
                Text(AppLocalizations.of(context)!.change_password,
                    style: Styles.textStyle24_600),
                Gap(32.h),
                const PasswordForm(),
                Gap(16.h),
                CustomButton(
                    onPressed: () => cubit.validateToChangePassword(),
                    text: AppLocalizations.of(context)!.save),
                TextButton(
                    onPressed: () => GoRouter.of(context).push(RoutesNames.enterPhone, extra: true),
                    child: Text(AppLocalizations.of(context)!.forgot_password,
                        style: Styles.textStyle16_400))
              ]))
        ])));
  }
}