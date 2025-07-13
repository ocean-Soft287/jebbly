import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jeebly_mobile/core/di/setup_get.dart';
import 'package:jeebly_mobile/core/helpers/localization/locale_cubit.dart';
import 'package:jeebly_mobile/core/routing/app_router.dart';
import 'package:jeebly_mobile/core/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/l10n/l10n.dart';

Widget buildAppRoot(BuildContext context) {
  return BlocProvider(
      create: (_) => getIt.get<LocaleCubit>(),
      child: BlocBuilder<LocaleCubit, Locale>(builder: (_, locale) {
        return MaterialApp.router(
            supportedLocales: L10n.all,
            locale: locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            title: 'Jeebly app',
            routerConfig: AppRouter.routes,
            builder: DevicePreview.appBuilder,
            theme: AppTheme.lightTheme);
      }));
}