import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:jeebly_mobile/features/drawer/addresses/bloc/addresses_bloc.dart';
import 'package:jeebly_mobile/features/drawer/addresses/bloc/addresses_event.dart';
import 'package:jeebly_mobile/features/drawer/addresses/cubit/address_cubit.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';

class ConfirmAddressButton extends StatelessWidget {
  const ConfirmAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressesBloc, BaseState>(
      listener: (_, state) {
        if (state.isSuccess) GoRouter.of(context).pop();
        if (state.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? '')),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          isActive: !state.isLoading,
          onPressed: () {
            final formCubit = AddressCubit.get(context);
            if (!formCubit.validateForm()) return;

            context.read<AddressesBloc>().add(AddAddressEvent(
                  title: formCubit.titleController.text.trim(),
                  details: formCubit.detailsController.text.trim(),
                  lng: formCubit.lng ?? '',
                  lat: formCubit.lat ?? '',
                ));
          },
          text: AppLocalizations.of(context)!.confirm_data,
        );
      },
    );
  }
}