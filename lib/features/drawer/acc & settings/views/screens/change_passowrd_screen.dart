import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/service_locator/setup_get.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_cubit.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/change_password_bloc/change_password_bloc.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/change_password_bloc/change_password_event.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/password_form.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/password_logo.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AccountCubit.get(context);
    return BlocProvider(
      create: (context) => getIt<ChangePasswordBloc>(),
      child: Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
              child: Column(children: [
            const Row(children: [BackButton()]),
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
                  BlocBuilder<ChangePasswordBloc, BaseState<void>>(
                    builder: (context, state) {
                      return CustomButton(
                          isActive: state.status != Status.loading,
                          onPressed: () {
                            if (cubit.passwordFormKey.currentState!.validate()) {
                              context.read<ChangePasswordBloc>().add(
                                  ChangePasswordEvent(
                                      oldPassword: cubit.oldPasswordController.text,
                                      phone: cubit.accountModel?.phoneNumber ?? '',
                                      newPassword: cubit.newPasswordController.text,
                                      confirmNewPassword: cubit.newPasswordController.text));
                            }
                          },
                          text: state.status == Status.loading
                              ? '...' // Or some loading text/icon if CustomButton supported it better
                              : AppLocalizations.of(context)!.save);
                    },
                  ),
                  TextButton(
                      onPressed: () => GoRouter.of(context)
                          .push(RoutesNames.enterPhone, extra: true),
                      child: Text(AppLocalizations.of(context)!.forgot_password,
                          style: Styles.textStyle16_400))
                ]))
          ]))),
    );
  }
}
