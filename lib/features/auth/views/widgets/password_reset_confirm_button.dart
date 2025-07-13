import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_cubit.dart';

class PasswordResetConfirmButton extends StatelessWidget {
  const PasswordResetConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return

      CustomButton(
          onPressed: () => cubit.validateToResetPassword(),
          text: AppLocalizations.of(context)!.save);
  }
}