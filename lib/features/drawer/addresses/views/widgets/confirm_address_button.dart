import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:jeebly_mobile/features/drawer/addresses/cubit/address_cubit.dart';
import 'package:jeebly_mobile/features/drawer/addresses/cubit/address_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfirmAddressButton extends StatelessWidget {
  const ConfirmAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(listener: (_, state) {
      if (state is AddressUpdated) GoRouter.of(context).pop();
    }, builder: (context, state) {
      var cubit = AddressCubit.get(context);
      return CustomButton(
          onPressed: () => cubit.validateToUpdateAddress(),
          text: AppLocalizations.of(context)!.confirm_data);
    });
  }
}