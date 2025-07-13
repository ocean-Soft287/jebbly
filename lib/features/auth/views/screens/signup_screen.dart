import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/auth_app_bar.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/auth_footer.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/auth_header_texts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/signup_button.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: const AuthAppBar(),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            child: Column(children: [
              Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AuthHeaderTexts(
                                header: AppLocalizations.of(context)!
                                    .create_a_new_acc,
                                body: AppLocalizations.of(context)!
                                    .a_few_simple_steps_stand_between_you_and_ordering_from_Jeebly),
                            const SignupForm(),
                            Gap(24.h),
                            const SignupButton()
                          ]))),
              AuthFooter(
                  text:
                      AppLocalizations.of(context)!.already_have_an_account_ii,
                  buttonText: AppLocalizations.of(context)!.login,
                  onPressed: () => GoRouter.of(context).pushReplacement(RoutesNames.login))
            ])));
  }
}