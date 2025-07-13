import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.labelText,
      this.validator,
      this.keyboardType,
      this.controller,
      this.suffixIcon,
      this.obscureText,
      this.hintText,
      this.maxLength,
      this.hintStyle,
      this.height,
      this.width,
      this.expands,
      this.suffixIconColor,
      this.initialValue,
      this.onChanged,
      this.maxLines,
      this.minLines,
      this.onTap,
      this.textInputAction,
      this.borderColor,
      this.contentPadding});

  final String? labelText, hintText, initialValue;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscureText, expands;
  final int? maxLength;
  final TextStyle? hintStyle;
  final double? height, width;
  final Color? suffixIconColor, borderColor;
  final void Function(String)? onChanged;
  final int? maxLines, minLines;
  final void Function()? onTap;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: TextFormField(
            onTap: onTap,
            initialValue: initialValue,
            onChanged: onChanged,
            expands: expands ?? false,
            maxLines: maxLines,
            minLines: minLines,
            cursorColor: AppColors.primary,
            maxLength: maxLength,
            obscureText: obscureText ?? false,
            controller: controller,
            keyboardType: keyboardType,
            textAlignVertical: TextAlignVertical.center,
            textInputAction: textInputAction,
            validator: validator,
            decoration: InputDecoration(
                counterText: '',
                contentPadding: contentPadding,
                alignLabelWithHint: true,
                suffixIcon: suffixIcon,
                hintText: hintText,
                hintStyle: hintStyle ?? Styles.textStyle14_400,
                suffixIconColor: suffixIconColor ?? AppColors.grey0,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: borderColor ?? AppColors.grey0, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.blue0, width: 1)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: AppColors.primary, width: 1)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: AppColors.primary, width: 1)),
                labelText: labelText,
                floatingLabelStyle:
                    Styles.textStyle14_400.copyWith(color: const Color(0xFF707070)),
                labelStyle: Styles.textStyle14_400,
                errorStyle: Styles.textStyle12_400.copyWith(color: AppColors.primary)),
            style: Styles.textHeading14));
  }
}