import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_cubit.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfirmCodeButton extends StatelessWidget {
  const ConfirmCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (_, state) {
      if (state is CodeConfirmedState) {
        GoRouter.of(context).go(RoutesNames.newPassword);
      }
    }, builder: (context, state) {
      var cubit = AuthCubit.get(context);
      return CustomButton(
          onPressed: () => cubit.confirmCode(),
          text: AppLocalizations.of(context)!.send,
          isActive: cubit.confirmButtonActive);
    });
  }
}