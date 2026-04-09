import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jeebly_mobile/core/service_locator/setup_get.dart';
import 'package:jeebly_mobile/core/helpers/localization/locale_cubit.dart';
import 'package:jeebly_mobile/core/theme/app_theme.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';
import 'package:jeebly_mobile/l10n/l10n.dart';

import '../../routing/router.dart';

import 'package:jeebly_mobile/features/drawer/addresses/bloc/addresses_bloc.dart';
import 'package:jeebly_mobile/features/drawer/addresses/bloc/addresses_event.dart';

Widget buildAppRoot(BuildContext context) {
  return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt.get<LocaleCubit>()),
        BlocProvider(create: (_) => getIt.get<AddressesBloc>()..add(const GetAddressesEvent())),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(builder: (_, locale) {
        return MaterialApp.router(
            supportedLocales: L10n.all,
            debugShowCheckedModeBanner: false,
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