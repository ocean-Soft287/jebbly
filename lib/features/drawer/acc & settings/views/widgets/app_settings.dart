import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/account_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/language_bottom_sheet.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/section_item.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return AccountSection(
        title: AppLocalizations.of(context)!.app_settings,
        sectionItems: [
          SectionItem(
              icon: AppAssets.acc,
              itemName: AppLocalizations.of(context)!.acc_data,
              onTap: () => GoRouter.of(context).push(RoutesNames.accountData)),
          SectionItem(
              icon: AppAssets.lang,
              itemName: AppLocalizations.of(context)!.lang,
              lang: true,
              onTap: () => showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40.r))),
                  context: context, builder: (_) => LanguageBottomSheet()))
        ]);
  }
}