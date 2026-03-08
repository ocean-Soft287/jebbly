import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_text_field.dart';
import 'package:jeebly_mobile/features/auth/cubit/login_cubit/login_cubit.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/auth_app_bar.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/auth_footer.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/auth_header_texts.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/country_picker.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AuthAppBar(),
        body: Form(
          key: _formKey,
          child: Padding(
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
                              SizedBox(height: 30),
                              CustomTextField(
                                controller: _phoneController,
                                keyboardType: TextInputType.number,
                                hintText:
                                    AppLocalizations.of(context)!.phone_number,
                                suffixIcon:
                                    CountryPicker(showDropDownButton: false),
                                validator: (v) => v == null || v.isEmpty
                                    ? AppLocalizations.of(context)!
                                        .phone_number_is_required
                                    : null,
                              ),
                              SizedBox(height: 8.h),
                              CustomTextField(
                                  controller: _passwordController,
                                  hintText:
                                      AppLocalizations.of(context)!.password,
                                  validator: (password) {
                                    if (password?.trim() == null ||
                                        password!.trim().isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .password_is_required;
                                    }
                                    return null;
                                  }),
                              SizedBox(height: 12.h),
                              BlocConsumer<LoginCubit, BaseState<void>>(
                                listener: (context, state) {
                                  if (state.status == Status.success) {
                                    GoRouter.of(context).go(RoutesNames.map);
                                  } else if (state.status == Status.failure) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(state.errorMessage ?? ''),
                                        backgroundColor: AppColors.ketchup0,
                                      ),
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  return state.status == Status.loading
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : CustomButton(
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              // final fcmToken =
                                              //     await CacheManager
                                              //         .getFcmToken();
                                              if (context.mounted) {
                                                context
                                                    .read<LoginCubit>()
                                                    .login(
                                                      _passwordController.text,
                                                      _phoneController.text,
                                                    );
                                              }
                                            }
                                          },
                                          text: AppLocalizations.of(context)!
                                              .login);
                                },
                              ),
                              TextButton(
                                  onPressed: () => GoRouter.of(context)
                                      .push(RoutesNames.enterPhone),
                                  child: Text(
                                      AppLocalizations.of(context)!
                                          .forgot_password,
                                      style: Styles.textStyle14_400
                                          .copyWith(color: AppColors.primary)))
                            ]))),
                AuthFooter(
                    text: AppLocalizations.of(context)!.do_not_have_an_account,
                    buttonText: AppLocalizations.of(context)!.create_a_new_acc,
                    onPressed: () => GoRouter.of(context)
                        .pushReplacement(RoutesNames.signup))
              ])),
        ));
  }
}
