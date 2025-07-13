import 'package:flutter/material.dart';

extension NumberTranslation on String {
  String numTr(BuildContext context) {
    final String languageCode = Localizations.localeOf(context).languageCode;
    if (languageCode == 'ar') {
      final arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
      return replaceAllMapped(RegExp(r'\d'), (match) => arabicNumbers[int.parse(match[0]!)] )
          .replaceAll('.', '،');
    }
    return this;
  }
}