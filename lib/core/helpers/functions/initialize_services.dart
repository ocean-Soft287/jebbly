import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/di/setup_get.dart';
import 'package:jeebly_mobile/core/helpers/bloc_observer.dart';
import 'package:jeebly_mobile/core/helpers/preferences_helper.dart';

initializeServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  setupLocator();
  await PreferencesHelper.init();
  Bloc.observer = MyBlocObserver();
}