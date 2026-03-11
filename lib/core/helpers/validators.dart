import 'package:flutter/material.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';

class Validators {
  static String? displayNameValidator(
      String? displayName, BuildContext context) {
    if (displayName == null || displayName.isEmpty) {
      return AppLocalizations.of(context)!.nameMustBeNotEmpty;
    }
    if (displayName.length < 3 || displayName.length > 30) {
      return AppLocalizations.of(context)!.invalidName;
    }
    return null;
  }

  static String? usernameValidator(String? username, BuildContext context) {
    if (username == null || username.isEmpty) {
      return null; // يسمح بأن يكون فارغًا
    }
    if (username.trim().isEmpty) {
      return AppLocalizations.of(context)!
          .usernameCannotBeOnlySpaces; // لا يمكن أن يحتوي على مسافات فقط
    }
    if (username.startsWith(' ')) {
      return AppLocalizations.of(context)!
          .usernameCannotStartWithSpace; // لا يمكن أن يبدأ بمسافة
    }
    return null;
  }

  static String? editProfileNameValidator(
      String? displayName, BuildContext context) {
    if (displayName!.length < 3 || displayName.length > 20) {
      return AppLocalizations.of(context)!.invalidName;
    }
    return null;
  }

  static String? emailValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.emailMustBeNotEmpty;
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return AppLocalizations.of(context)!.enter_vaild_email;
    }
    return null;
  }

  static String? passwordValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.please_enter_password;
    }
    if (value.length < 8) {
      return AppLocalizations.of(context)!.password_length;
    }
    // تحقق من وجود أحرف كبيرة
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return AppLocalizations.of(context)!.passwordMissingUppercase;
    }
    // تحقق من وجود أحرف صغيرة
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return AppLocalizations.of(context)!.passwordMissingLowercase;
    }
    // تحقق من وجود أرقام
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return AppLocalizations.of(context)!.passwordMissingDigit;
    }
    // تحقق من وجود أحرف خاصة
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return AppLocalizations.of(context)!.passwordMissingSpecialChar;
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  static String? repeatPasswordValidator(
      {String? value, String? Password, required BuildContext context}) {
    if (value != Password) {
      return AppLocalizations.of(context)!.password_not_match;
    }
    return null;
  }

  static String? phoneNumberValidator(
      String? phoneNumber, BuildContext context) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return AppLocalizations.of(context)!.phoneNumberEmpty;
    }
    if (phoneNumber.length != 11) {
      return AppLocalizations.of(context)!.phoneNumberLength;
    }
    if (!RegExp(r'^01[0-2,5]\d{8}$').hasMatch(phoneNumber)) {
      return AppLocalizations.of(context)!.invalidPhoneNumberFormat;
    }
    return null;
  }

  static String? locationValidator(String? location, BuildContext context) {
    if (location == null || location.isEmpty) {
      return AppLocalizations.of(context)!.locationEmpty;
    }
    return null;
  }

  static String? validateEmpty(String? text, BuildContext context) {
    if (text == null || text.isEmpty) {
      return AppLocalizations.of(context)!.fieldEmpty;
    }
    return null;
  }

  static String? timeValidator(String? time, BuildContext context) {
    if (time == null || time.isEmpty) {
      return AppLocalizations.of(context)!.timeEmpty;
    }
    if (!RegExp(r'^(?:[01]\d|2[0-3]):[0-5]\d:[0-5]\d$').hasMatch(time)) {
      return AppLocalizations.of(context)!.invalidTime;
    }
    return null;
  }

  static String? ageValidator(String? age, BuildContext context) {
    if (age == null || age.isEmpty) {
      return null;
    }
    int? ageValue = int.tryParse(age);
    if (ageValue == null || ageValue < 18 || ageValue > 48) {
      return AppLocalizations.of(context)!.invalidAge;
    }
    return null;
  }

  static String? countryValidator(String? country, BuildContext context) {
    if (country == null || country.isEmpty) {
      return AppLocalizations.of(context)!.countryEmpty;
    }
    return null;
  }

  static String? cityValidator(String? city, BuildContext context) {
    if (city == null || city.isEmpty) {
      return AppLocalizations.of(context)!.cityEmpty;
    }
    return null;
  }

  /// Validates an Egyptian national ID (الرقم القومي المصري).
  /// Requirements: exactly 14 characters and digits only.
  static String? nationalIdValidator(String? id, BuildContext context) {
    if (id == null || id.isEmpty) {
      return AppLocalizations.of(context)!.nationalIdEmpty;
    }
    // exactly 14 digits
    if (!RegExp(r'^\d{14}$').hasMatch(id)) {
      return AppLocalizations.of(context)!.invalidNationalId;
    }
    return null;
  }

  /// Returns true if the input contains only ASCII digits 0-9.
  /// This excludes Arabic-Indic digits (٠١٢٣٤٥٦٧٨٩) and Eastern-Arabic digits (۰۱۲۳۴۵۶۷۸۹).
  static bool isAsciiDigitsOnly(String input) {
    return RegExp(r'^[0-9]+$').hasMatch(input);
  }

  static String? englishDigitsOnlyValidator(String? value,
      {bool allowEmpty = false, required BuildContext context}) {
    if (value == null || value.isEmpty) {
      return allowEmpty ? null : AppLocalizations.of(context)!.fieldEmpty;
    }
    if (!isAsciiDigitsOnly(value)) {
      return AppLocalizations.of(context)!.onlyEnglishDigits;
    }
    return null;
  }
}
