import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/helpers/functions/number_translation.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/widgets/custom_text_field.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_cubit.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_state.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/phone_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (_, state) {
      if (state is AuthSuccessState) GoRouter.of(context).go(RoutesNames.map);
    }, builder: (_, state) {
      var cubit = AuthCubit.get(context);
      return Form(
          key: cubit.signUpFormKey,
          child: Column(children: [
            CustomTextField(
                hintText: AppLocalizations.of(context)!.first_and_last_name,
                validator: (name) {
                  if (name?.trim() == null || name!.trim().isEmpty) {
                    return AppLocalizations.of(context)!.name_is_required;
                  }
                  return null;
                }),
            Gap(24.h),
            PhoneField(),
            Gap(24.h),
            CustomTextField(
                hintText: AppLocalizations.of(context)!.password +
                    AppLocalizations.of(context)!.pass_hint.numTr(context),
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
                })
          ]));
    });
  }
}