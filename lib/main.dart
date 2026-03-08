import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/app/jeebly_app.dart';
import 'package:jeebly_mobile/core/helpers/functions/initialize_services.dart';

import 'core/helpers/bloc_observer.dart';
import 'core/service_locator/setup_get.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'navigatorKey-${DateTime.now().millisecondsSinceEpoch}');

void main() {
  initializeServices();
  setupLocator();
  Bloc.observer = MyBlocObserver();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(const JeeblyApp()));
}