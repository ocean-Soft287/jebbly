import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:jeebly_mobile/features/onboarding/cubit/onboarding_state.dart';

class OnboardingText extends StatelessWidget {
  const OnboardingText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(builder: (_, state) {
      var cubit = OnboardingCubit.get(context);
      return Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: Text(cubit.currentText,
                  key: ValueKey<String>(cubit.currentText),
                  style: Styles.textStyle36)));
    });
  }
}