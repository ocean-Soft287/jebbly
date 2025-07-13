import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:jeebly_mobile/features/onboarding/cubit/onboarding_state.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(builder: (_, state) {
      var cubit = OnboardingCubit.get(context);
      int current = cubit.currentIndex;
      return Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: SizedBox(
              height: 9,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                        width: current == index ? 42 : 9,
                        height: 9,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: current == index
                                ? AppColors.white
                                : AppColors.grey0));
                  })));
    });
  }
}