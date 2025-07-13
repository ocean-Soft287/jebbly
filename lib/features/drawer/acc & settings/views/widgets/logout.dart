import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/account_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/section_item.dart';
import 'package:restart_app/restart_app.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountSection(
        title: AppLocalizations.of(context)!.exit,
        sectionItems: [
          SectionItem(
              icon: AppAssets.logout,
              itemName: AppLocalizations.of(context)!.logout,
              onTap: () => Restart.restartApp())
        ]);
  }
}