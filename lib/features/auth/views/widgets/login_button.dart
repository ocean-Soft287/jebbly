import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return CustomButton(
        onPressed: () => cubit.validateToLogin(), text: AppLocalizations.of(context)!.login);
  }
}