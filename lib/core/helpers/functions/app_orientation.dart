import 'package:flutter/services.dart';

class AppOrientation {
  static setPreferredOrientation() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}