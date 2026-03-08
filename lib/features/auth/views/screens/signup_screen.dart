import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/auth_app_bar.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/auth_footer.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/auth_header_texts.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:jeebly_mobile/core/widgets/custom_text_field.dart';
import 'package:jeebly_mobile/features/auth/cubit/register_cubit/register_cubit.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: const AuthAppBar(),
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
                                      .create_a_new_acc,
                                  body: AppLocalizations.of(context)!
                                      .a_few_simple_steps_stand_between_you_and_ordering_from_Jeebly),
                              Gap(24.h),
                              CustomTextField(
                                  controller: _nameController,
                                  hintText: AppLocalizations.of(context)!
                                      .first_and_last_name,
                                  validator: (name) {
                                    if (name?.trim() == null ||
                                        name!.trim().isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .name_is_required;
                                    }
                                    return null;
                                  }),
                              Gap(16.h),
                              CustomTextField(
                                controller: _phoneController,
                                keyboardType: TextInputType.number,
                                hintText:
                                    AppLocalizations.of(context)!.phone_number,
                                validator: (v) => v == null || v.isEmpty
                                    ? AppLocalizations.of(context)!
                                        .phone_number_is_required
                                    : null,
                              ),
                              Gap(16.h),
                              CustomTextField(
                                  controller: _passwordController,
                                  hintText:
                                      AppLocalizations.of(context)!.password,
                                  obscureText: true,
                                  validator: (password) {
                                    if (password?.trim() == null ||
                                        password!.trim().isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .password_is_required;
                                    }
                                    return null;
                                  }),
                              Gap(24.h),
                              BlocConsumer<RegisterCubit, BaseState<void>>(
                                listener: (context, state) {
                                  if (state.status == Status.success) {
                                    GoRouter.of(context)
                                        .push(RoutesNames.login);
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
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              context.read<RegisterCubit>().register(
                                                    fullName:
                                                        _nameController.text,
                                                    password:
                                                        _passwordController.text,
                                                    phoneNumber:
                                                        _phoneController.text,
                                                  );
                                            }
                                          },
                                          text: AppLocalizations.of(context)!
                                              .create_account);
                                },
                              ),
                              Gap(16.h),
                              Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                        AppLocalizations.of(context)!
                                            .when_you_create_an_account_you_agree_to,
                                        style: Styles.textStyle12_400),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            minimumSize: const Size(0, 0),
                                            tapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap),
                                        onPressed: () {},
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .terms_and_conditions,
                                            style: Styles.textStyle12_400
                                                .copyWith(
                                                    color: AppColors.primary)))
                                  ])
                            ]))),
                AuthFooter(
                    text: AppLocalizations.of(context)!
                        .already_have_an_account_ii,
                    buttonText: AppLocalizations.of(context)!.login,
                    onPressed: () => GoRouter.of(context)
                        .pushReplacement(RoutesNames.login))
              ])),
        ));
  }
}
