import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeebly_mobile/app/jeebly_app.dart';
import 'package:jeebly_mobile/core/helpers/functions/initialize_services.dart';

void main() {
  initializeServices();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(const JeeblyApp()));
}