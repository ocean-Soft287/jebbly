import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/widgets/custom_text_field.dart';
import 'package:jeebly_mobile/features/auth/views/widgets/country_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      keyboardType: TextInputType.number,
        hintText: AppLocalizations.of(context)!.phone_number,
        suffixIcon: CountryPicker(showDropDownButton: false),
    validator: (phone) {
      if (phone?.trim() == null || phone!.trim().isEmpty) {
        return AppLocalizations.of(context)!.phone_number_is_required;
      }
      if (!RegExp(r'^[0-9]+$').hasMatch(phone)) {
        return AppLocalizations.of(context)!.only_numbers_are_allowed;
      }
      return null;
    }
    );
  }
}