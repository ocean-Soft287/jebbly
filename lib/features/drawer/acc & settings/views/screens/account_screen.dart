import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/about.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/account_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/app_settings.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/delete_account_dialog.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/logout.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: [
              const AccountHeader(),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 35.h),
                  child: Column(spacing: 24.h, children: [
                    const AppSettings(),
                    const About(),
                    const Logout()
                  ])),
              CustomDivider(),
              Gap(20.h),
              TextButton(
                  onPressed: () => showDialog(context: context, builder: (_) =>
                  const DeleteAccountDialog()),
                  child: Text(AppLocalizations.of(context)!.delete_my_account,
                      style: Styles.textStyle16_600
                          .copyWith(color: AppColors.grey2)))
            ])));
  }
}