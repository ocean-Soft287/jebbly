import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text_field.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_cubit.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_state.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/phone_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (_, state) {
      if (state is AuthSuccessState) GoRouter.of(context).go(RoutesNames.map);
    }, builder: (_, state) {
      var cubit = AuthCubit.get(context);
      return Form(
          key: cubit.loginFormKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            PhoneField(),
            Gap(20.h),
            CustomTextField(
                hintText: AppLocalizations.of(context)!.password,
                validator: (password) {
                  if (password?.trim() == null || password!.trim().isEmpty) {
                    return AppLocalizations.of(context)!.password_is_required;
                  }
                  return null;
                }),
            TextButton(
                onPressed: () =>
                    GoRouter.of(context).push(RoutesNames.enterPhone),
                child: Text(AppLocalizations.of(context)!.forgot_password,
                    style: Styles.textStyle14_400.copyWith(color: AppColors.primary)))
          ]));
    });
  }
}