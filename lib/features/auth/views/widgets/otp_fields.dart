import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_cubit.dart';
import 'package:jeebly_mobile/features/auth/cubit/auth_state.dart';
import 'package:pinput/pinput.dart';

class OtpFields extends StatelessWidget {
  const OtpFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      var cubit = AuthCubit.get(context);
      final FocusNode focusNode = FocusNode();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!focusNode.hasFocus) {
          focusNode.requestFocus();
        }
      });
      return Pinput(
          focusNode: focusNode,
          onCompleted: (code) => cubit.activateConfirmButton(code),
          onChanged: (code) => cubit.updateCode(code),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          defaultPinTheme: PinTheme(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              width: 50.sp,
              textStyle:
                  Styles.textStyle24_600.copyWith(color: AppColors.black3),
              height: 50.sp,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(width: 1.sp, color: AppColors.black3))));
    });
  }
}