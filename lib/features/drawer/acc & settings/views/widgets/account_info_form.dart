import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/widgets/custom_text_field.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_cubit.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_state.dart';

class AccountInfoForm extends StatelessWidget {
  const AccountInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        var cubit = AccountCubit.get(context);
        return Form(
            key: cubit.accountDataFormKey,
            child: Column(children: [
              CustomTextField(
                  controller: cubit.phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (phone) {
                    if (phone?.trim() == null || phone!.trim().isEmpty) {
                      return AppLocalizations.of(context)!.phone_number_is_required;
                    }
                    return null;
                  }),
              Gap(16.h),
              CustomTextField(
                  labelText: AppLocalizations.of(context)!.first_and_last_name,
                  controller: cubit.nameController,
                  validator: (name) {
                    if (name?.trim() == null || name!.trim().isEmpty) {
                      return AppLocalizations.of(context)!.name_is_required;
                    }
                    return null;
                  }),
              Gap(16.h),
              CustomTextField(
                  labelText: AppLocalizations.of(context)!.email,
                  controller: cubit.emailController,
                  validator: (email) {
                    if (email?.trim() != null &&
                        email!.trim().isNotEmpty &&
                        !RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        ).hasMatch(email)) {
                      return AppLocalizations.of(context)!.invalid_email;
                    }
                    return null;
                  })
            ]));
      },
    );
  }
}