import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primary,
      fontFamily: 'inter',
      scaffoldBackgroundColor: AppColors.grey0,
      useMaterial3: false);
}