import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeebly_mobile/app/jeebly_app.dart';
import 'package:jeebly_mobile/core/helpers/functions/initialize_services.dart';


final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'navigatorKey-${DateTime.now().millisecondsSinceEpoch}');

Future<void> main() async {
  await initializeServices();

  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(const JeeblyApp()));
}
