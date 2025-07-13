import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/features/onboarding/cubit/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  static OnboardingCubit get(context) => BlocProvider.of(context);

  String currentText = '';
  List<String> texts = [];
  int currentIndex = 0;
  Timer? _timer;

  List<String> images = [
    AppAssets.onboarding1,
    AppAssets.onboarding2,
    AppAssets.onboarding3,
    AppAssets.onboarding4
  ];

  void updateOnboarding(List<String> newTexts) {
    if(isClosed) return;
    texts = newTexts;
    currentIndex = 0;
    _setText();
    startTimer();
  }

  void _setText() {
    if (texts.isNotEmpty) {
      currentText = texts[currentIndex];
      emit(OnboardingUpdatedState());
    }
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (texts.isNotEmpty) {
        currentIndex = (currentIndex + 1) % texts.length;
        _setText();
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}