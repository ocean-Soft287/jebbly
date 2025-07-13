import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/helpers/functions/build_app_root.dart';

class JeeblyApp extends StatelessWidget {
  const JeeblyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
        enabled: !kReleaseMode,
        builder: (_) => ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            designSize: const Size(393, 852),
            child: buildAppRoot(context)));
  }
}