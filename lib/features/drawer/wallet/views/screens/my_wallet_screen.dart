import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/features/drawer/wallet/views/widgets/add_wallet_button.dart';
import 'package:jeebly_mobile/features/drawer/wallet/views/widgets/available_credit.dart';
import 'package:jeebly_mobile/features/drawer/wallet/views/widgets/wallet_toggle_taps.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: AppLocalizations.of(context)!.my_wallet),
        body: const Column(children: [
          CustomDivider(),
          AvailableCredit(),
          CustomDivider(),
          WalletToggleTaps()
        ]),
        floatingActionButton: const AddWalletButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked);
  }
}