import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/services/service_container.dart';

class ProvidedServices extends StatelessWidget {
  const ProvidedServices({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(spacing: 22.w, children: [
          ServiceContainer(
              title: AppLocalizations.of(context)!.jeebly_eat,
              subtitle: AppLocalizations.of(context)!.restaurants,
              image: AppAssets.eat),
          ServiceContainer(
              title: AppLocalizations.of(context)!.jeebly_get,
              subtitle: AppLocalizations.of(context)!.food,
              image: AppAssets.get),
          ServiceContainer(
              title: AppLocalizations.of(context)!.jeebly_shop,
              subtitle: AppLocalizations.of(context)!.stores,
              image: AppAssets.shop)
        ]));
  }
}