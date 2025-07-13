import 'package:flutter/material.dart';

class CustomLoading {
  static void showCustomLoadingIndicator(BuildContext context,
      {bool? cancelable}) {
    showDialog(
        // barrierColor: AppColors.white.withValues(alpha: .3),
        context: context,
        builder: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
        barrierDismissible: cancelable ?? true);
  }
}