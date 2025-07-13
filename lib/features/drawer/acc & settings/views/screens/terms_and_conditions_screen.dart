import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: const CustomAppBar(),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: const Column(children: [
              CustomDivider(),
              Text(
                  'Terms and Conditions for the Application\n\n1. '
                  'Acceptance of Terms\n\nBy downloading, installing, or using this '
                  'application, you agree to be bound by these Terms and Conditions. If you do'
                  ' not agree, please do not use the application.\n\n2. User Eligibility\n\n'
                  'This application is intended for users who are at least 18 years old. By '
                  'using the app, you confirm that you meet this requirement.\n\n3. License '
                  'to Use\n\nThe application grants you a limited, non-exclusive, '
                  'non-transferable, and revocable license to use it for personal, '
                  'non-commercial purposes.\n\n4. User Responsibilities\n\n- You agree not '
                  'to use the application for any illegal or unauthorized purposes.\n\n- You are'
                  ' responsible for maintaining the confidentiality of your account and '
                  'password.\n\n5. Privacy Policy\n\nYour use of the application is also '
                  'governed by our Privacy Policy, which outlines how we collect, use, '
                  'and protect your personal data.',
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr)
            ])));
  }
}