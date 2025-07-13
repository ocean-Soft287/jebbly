import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/widgets/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_cubit.dart';

class AccountInfoForm extends StatelessWidget {
  const AccountInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AccountCubit.get(context);
    return Form(
      key: cubit.accountDataFormKey,
        child: Column(children: [
      CustomTextField(
          initialValue: '+201557712317',
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
          initialValue: 'أبو بكر علي أحمد',
          validator: (name) {
            if (name?.trim() == null || name!.trim().isEmpty) {
              return AppLocalizations.of(context)!.name_is_required;
            }
            return null;
          }),
      Gap(16.h),
      CustomTextField(
          labelText: AppLocalizations.of(context)!.email,
          initialValue: 'john.doe@example.com',
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
  }
}