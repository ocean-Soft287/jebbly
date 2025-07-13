import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:jeebly_mobile/core/widgets/custom_text_field.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_state.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountState>(listener: (_, state) {
      if (state is UpdatePasswordSuccessState) {
        GoRouter.of(context)
            .pushReplacement(RoutesNames.updatePasswordSuccess, extra: true);
      }
    }, builder: (_, state) {
      var cubit = AccountCubit.get(context);
      return Form(
          key: cubit.passwordFormKey,
          child: Column(
              spacing: 12.h,
              children: [
            CustomTextField(
                controller: cubit.oldPasswordController,
                labelText: AppLocalizations.of(context)!.old_password,
                obscureText: cubit.oldPasswordHidden,
                maxLines: 1,
                suffixIcon: InkWell(
                    onTap: () => cubit.toggleOldPassword(),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              cubit.oldPasswordHidden
                                  ? AppLocalizations.of(context)!.show
                                  : AppLocalizations.of(context)!.hide,
                              style: Styles.textStyle13_500)
                        ])),
                validator: (password) {
                  if (password?.trim() == null || password!.trim().isEmpty) {
                    return AppLocalizations.of(context)!
                        .old_password_is_required;
                  }
                  return null;
                }),
            CustomTextField(
                controller: cubit.newPasswordController,
                labelText: AppLocalizations.of(context)!.new_password,
                obscureText: cubit.newPasswordHidden,
                maxLines: 1,
                suffixIcon: InkWell(
                    onTap: () => cubit.toggleNewPassword(),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              cubit.newPasswordHidden
                                  ? AppLocalizations.of(context)!.show
                                  : AppLocalizations.of(context)!.hide,
                              style: Styles.textStyle13_500)
                        ])),
                validator: (password) {
                  if (password?.trim() == null || password!.trim().isEmpty) {
                    return AppLocalizations.of(context)!
                        .new_password_is_required;
                  } else if (password.length < 6) {
                    return AppLocalizations.of(context)!
                        .password_must_be_at_least_6_characters_long;
                  } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$')
                      .hasMatch(password)) {
                    return AppLocalizations.of(context)!
                        .password_must_include_both_letters_and_numbers;
                  }
                  return null;
                }),
            CustomTextField(
                minLines: 1,
                maxLines: 1,
                validator: (passwordConfirmation) {
                  if (passwordConfirmation?.trim() == null ||
                      passwordConfirmation!.trim().isEmpty) {
                    return AppLocalizations.of(context)!
                        .password_confirmation_is_required;
                  }
                  if (passwordConfirmation !=
                      cubit.newPasswordController.text) {
                    return AppLocalizations.of(context)!
                        .passwords_are_not_identical;
                  }
                  return null;
                },
                labelText: AppLocalizations.of(context)!.confirm_new_password,
                suffixIcon: InkWell(
                    onTap: cubit.toggleNewPasswordConfirmationVisibility,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              cubit.newPasswordConfirmationHidden
                                  ? AppLocalizations.of(context)!.show
                                  : AppLocalizations.of(context)!.hide,
                              style: Styles.textStyle13_500)
                        ])),
                obscureText: cubit.newPasswordConfirmationHidden)
          ]));
    });
  }
}