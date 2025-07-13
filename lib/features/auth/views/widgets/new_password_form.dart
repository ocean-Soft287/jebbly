import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:jeebly_mobile/core/widgets/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_cubit.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_state.dart';

class NewPasswordForm extends StatelessWidget {
  const NewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (_, state) {
      if (state is AuthSuccessState) GoRouter.of(context).go(RoutesNames.map);
    }, builder: (context, state) {
      var cubit = AuthCubit.get(context);
      return Form(
          key: cubit.resetPasswordFormKey,
          child: Column(spacing: 12.h, children: [
            CustomTextField(
                minLines: 1,
                maxLines: 1,
                controller: cubit.newPasswordController,
                validator: (password) {
                  if (password?.trim() == null || password!.trim().isEmpty) {
                    return AppLocalizations.of(context)!.password_is_required;
                  } else if (password.length < 6) {
                    return AppLocalizations.of(context)!
                        .password_must_be_at_least_6_characters_long;
                  } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$')
                      .hasMatch(password)) {
                    return AppLocalizations.of(context)!
                        .password_must_include_both_letters_and_numbers;
                  }
                  return null;
                },
                labelText: AppLocalizations.of(context)!.new_password,
                suffixIcon: InkWell(
                    onTap: cubit.toggleNewPasswordVisibility,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              cubit.hiddenNewPassword
                                  ? AppLocalizations.of(context)!.show
                                  : AppLocalizations.of(context)!.hide,
                              style: Styles.textStyle13_500)
                        ])),
                obscureText: cubit.hiddenNewPassword),
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
                              cubit.hiddenNewPasswordConfirmation
                                  ? AppLocalizations.of(context)!.show
                                  : AppLocalizations.of(context)!.hide,
                              style: Styles.textStyle13_500)
                        ])),
                obscureText: cubit.hiddenNewPasswordConfirmation)
          ]));
    });
  }
}