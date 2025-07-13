import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';

class SingleIngredient extends StatelessWidget {
  const SingleIngredient({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
      Checkbox(
          value: true,
          onChanged: (_) {},
          fillColor: WidgetStatePropertyAll(AppColors.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
      CustomText(title, style: Styles.textStyle10_300.copyWith(color: AppColors.black0))
    ]);
  }
}