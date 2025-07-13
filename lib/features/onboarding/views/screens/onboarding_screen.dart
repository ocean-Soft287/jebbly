import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:jeebly_mobile/features/onboarding/views/widgets/auth_options.dart';
import 'package:jeebly_mobile/features/onboarding/views/widgets/language_button.dart';
import 'package:jeebly_mobile/features/onboarding/views/widgets/onboarding_image.dart';
import 'package:jeebly_mobile/features/onboarding/views/widgets/onboarding_text.dart';
import 'package:jeebly_mobile/features/onboarding/views/widgets/page_indicator.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/helpers/localization/locale_cubit.dart';
import 'package:jeebly_mobile/features/onboarding/views/widgets/theme_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateOnboardingTexts();
  }

  void _updateOnboardingTexts() {
    var cubit = OnboardingCubit.get(context);
    List<String> texts = [
      AppLocalizations.of(context)!.a_variety_of_restaurants_to_order_from,
      AppLocalizations.of(context)!.discover_our_diverse_selection_of_snacks,
      AppLocalizations.of(context)!
          .shop_with_ease_and_enjoy_a_unique_experience,
      AppLocalizations.of(context)!
          .not_just_restaurants_even_sweets_are_available
    ];
    cubit.updateOnboarding(texts);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocaleCubit, Locale>(
        listener: (context, locale) {
          _updateOnboardingTexts();
        },
        child: Scaffold(
            body: Stack(children: [
          Column(children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                child: Stack(children: [
                  const OnboardingImage(),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(20.h),
                        const Row(
                            children: [
                          LanguageButton(),
                          Spacer(),
                          ThemeButton()
                        ]),
                        const Spacer(),
                        const PageIndicator(),
                        Gap(7.h),
                        const OnboardingText(),
                        Gap(109.h)
                      ])
                ])),
            const Spacer()
          ]),
          Align(alignment: Alignment.bottomCenter, child: const AuthOptions())
        ])));
  }
}