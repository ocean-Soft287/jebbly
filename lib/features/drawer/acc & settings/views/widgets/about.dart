import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/account_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/section_item.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountSection(
        title: AppLocalizations.of(context)!.about,
        sectionItems: [
          SectionItem(
              icon: AppAssets.awardII,
              itemName: AppLocalizations.of(context)!.terms_and_conditions,
              onTap: () =>
                  GoRouter.of(context).push(RoutesNames.termsAndConditions)),
          SectionItem(
              icon: AppAssets.info,
              itemName: AppLocalizations.of(context)!.about_us,
              onTap: () => GoRouter.of(context).push(RoutesNames.aboutUs)),
          SectionItem(
              icon: AppAssets.star,
              itemName: AppLocalizations.of(context)!.rate_app)
        ]);
  }
}