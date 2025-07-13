import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.prefixIcon,
    this.backgroundColor,
    this.width,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.fontSize,
    this.fontWeight,
    this.margin,
    this.textStyle,
    this.height,
    this.suffixIcon,
    this.isActive,
    this.boxShadow,
    this.textOverflow,
    this.withSpacer,
    this.rowCrossAlignment,
    this.rowMainAlignment,
  });

  final VoidCallback onPressed;
  final String text;
  final Widget? prefixIcon, suffixIcon;
  final Color? backgroundColor;
  final double? width, height;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final bool? isActive, withSpacer;
  final List<BoxShadow>? boxShadow;
  final TextOverflow? textOverflow;
  final CrossAxisAlignment? rowCrossAlignment;
  final MainAxisAlignment? rowMainAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: margin ?? const EdgeInsets.all(0),
        child: Container(
            decoration: BoxDecoration(
                color: backgroundColor ??
                    (isActive == false
                        ? AppColors.grey0
                        : AppColors.primary),
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
                boxShadow: boxShadow,
                border: borderColor != null
                    ? Border.all(color: borderColor!)
                    : null),
            width: width ??
                (kIsWeb
                    ? MediaQuery.of(context).size.width / 3
                    : double.infinity),
            height: height ?? 47.h,
            child: MaterialButton(
                padding:
                    kIsWeb ? EdgeInsets.symmetric(vertical: 20.h) : padding,
                onPressed: isActive == false ? null : onPressed,
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment:
                        rowMainAlignment ?? MainAxisAlignment.center,
                    crossAxisAlignment:
                        rowCrossAlignment ?? CrossAxisAlignment.center,
                    children: [
                      if (prefixIcon != null) prefixIcon!,
                      SizedBox(width: prefixIcon != null ? 8 : 0),
                      if (withSpacer == false)
                        Text(
                          text,
                          style: textStyle ??
                              TextStyle(
                                  fontSize: fontSize ?? 13.sp,
                                  color: textColor ??
                                      (isActive == false
                                          ? AppColors.grey1
                                          : AppColors.white),
                                  fontWeight: fontWeight ?? FontWeight.w600,
                              fontFamily: 'inter'),
                          overflow: textOverflow ?? TextOverflow.ellipsis,
                          textAlign: TextAlign.start, // Align text to the start
                        )
                      else
                        Expanded(
                            child: Text(text,
                                style: textStyle ??
                                    TextStyle(
                                        fontSize: fontSize ?? 16.sp,
                                        color: textColor ??
                                            (isActive == false
                                                ? const Color(0xFFB7B7B7)
                                                : AppColors.white),
                                        fontWeight:
                                            fontWeight ?? FontWeight.w700),
                                overflow: textOverflow ?? TextOverflow.ellipsis,
                                textAlign: TextAlign.center)),
                      SizedBox(width: suffixIcon != null ? 8 : 0),
                      if (suffixIcon != null) suffixIcon!
                    ]))));
  }
}