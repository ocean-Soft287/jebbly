import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_cubit.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_state.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/auth_footer.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/auth_header_texts.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/phone_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EnterPhoneScreen extends StatelessWidget {
  const EnterPhoneScreen({super.key, this.fromAccount});
  final bool? fromAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            child: Column(children: [
              Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: BlocConsumer<AuthCubit, AuthState>(
                          listener: (_, state) {
                        if (state is AuthSuccessState) {
                            GoRouter.of(context).push(RoutesNames.otp);
                        }
                      }, builder: (_, state) {
                        var cubit = AuthCubit.get(context);
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Gap(76.h),
                              CustomSVG(assetName: AppAssets.phone),
                              Gap(22.h),
                              AuthHeaderTexts(
                                  header: AppLocalizations.of(context)!
                                      .please_enter_phone_number,
                                  body: AppLocalizations.of(context)!
                                      .do_not_worry_we_will_help_u_to_create_a_new_password),
                              Form(
                                  key: cubit.enterPhoneFormKey,
                                  child: PhoneField()),
                              Gap(22.h),
                              CustomButton(
                                  onPressed: () =>
                                      cubit.validateToRequestCode(),
                                  text: AppLocalizations.of(context)!
                                      .continue_text)
                            ]);
                      }))),
              if (fromAccount != true)
                AuthFooter(
                    text: AppLocalizations.of(context)!.do_not_have_an_account,
                    buttonText: AppLocalizations.of(context)!.create_a_new_acc,
                    onPressed: () => GoRouter.of(context)
                        .pushReplacement(RoutesNames.signup))
            ])));
  }
}