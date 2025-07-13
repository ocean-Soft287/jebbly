import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key, required this.text, required this.buttonText, required this.onPressed});
  final String text, buttonText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(text,
          style: Styles.textStyle12_400.copyWith(fontWeight: FontWeight.w600)),
      TextButton(
          onPressed: onPressed,
          child: Text(buttonText,
              style: Styles.textStyle12_400
                  .copyWith(fontWeight: FontWeight.w600, color: AppColors.primary)))
    ]);
  }
}