import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_cubit.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = AuthCubit.get(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomButton(
          onPressed: () => cubit.validateToSignUp(),
          text: AppLocalizations.of(context)!.create_account),
      Gap(5.h),
      Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
        Text(
            AppLocalizations.of(context)!
                .when_you_create_an_account_you_agree_to,
            style: Styles.textStyle12_400),
        TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                minimumSize: Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            onPressed: () {},
            child: Text(AppLocalizations.of(context)!.terms_and_conditions,
                style: Styles.textStyle12_400.copyWith(color: AppColors.primary)))
      ])
    ]);
  }
}