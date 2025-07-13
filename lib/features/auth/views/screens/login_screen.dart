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
import 'package:jeebly_mobile/features/auth/views/widgets/login_button.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
        appBar: AuthAppBar(),
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
                                    .welcome_once_again,
                                body: AppLocalizations.of(context)!
                                    .login_with_phone_number),
                            Gap(76.h),
                            const LoginForm(),
                            const LoginButton()
                          ]))),
              AuthFooter(text: AppLocalizations.of(context)!.do_not_have_an_account,
              buttonText: AppLocalizations.of(context)!.create_a_new_acc,
              onPressed: () => GoRouter.of(context).pushReplacement(RoutesNames.signup))
            ])));
  }
}