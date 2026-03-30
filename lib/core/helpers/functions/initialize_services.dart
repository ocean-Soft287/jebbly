import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/service_locator/setup_get.dart';
import 'package:jeebly_mobile/core/helpers/bloc_observer.dart';
import 'package:jeebly_mobile/core/cache_manager/cache_manager.dart';

Future<void> initializeServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await setupLocator();
  await CacheManager.init();
  Bloc.observer = MyBlocObserver();
}