import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/local_storage/local_storage.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_image.dart';

import '../../../../core/service_locator/service_locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        if ( getIt.get<ITokenCache>().getAccessToken() == null) {
        GoRouter.of(context).go(RoutesNames.onBoarding);
      }else {
         print('no token: ${getIt.get<ITokenCache>().getAccessToken()}');
        GoRouter.of(context).go(RoutesNames.layout,extra: 0);
      }
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(70),
                child: CustomImage(imagePath: 'assets/images/logo.png'))));
  }
}