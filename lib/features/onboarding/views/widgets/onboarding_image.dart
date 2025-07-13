import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/widgets/custom_image.dart';
import 'package:jeebly_mobile/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:jeebly_mobile/features/onboarding/cubit/onboarding_state.dart';

class OnboardingImage extends StatelessWidget {
  const OnboardingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(builder: (_, state) {
      var cubit = OnboardingCubit.get(context);
      return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomImage(
              imagePath: cubit.images[cubit.currentIndex], fit: BoxFit.cover));
    });
  }
}