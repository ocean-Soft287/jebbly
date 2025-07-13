import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/onboarding/cubit/onboarding_cubit.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        height: height * .35,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(66.r))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomButton(
              onPressed: () => GoRouter.of(context).push(RoutesNames.signup),
              text: AppLocalizations.of(context)!.register_a_new_account),
          Gap(9.h),
          CustomButton(
              onPressed: () => GoRouter.of(context).push(RoutesNames.login),
              text: AppLocalizations.of(context)!.already_have_an_account,
              backgroundColor: AppColors.ketchup0,
              textColor: AppColors.primary),
          Gap(9.h),
          CustomButton(
              onPressed: () {
                OnboardingCubit.get(context).close();
                GoRouter.of(context).go(RoutesNames.map);
              },
              text: AppLocalizations.of(context)!.continue_as_a_guest,
              backgroundColor: Colors.transparent,
              textColor: AppColors.primary)
        ]));
  }
}