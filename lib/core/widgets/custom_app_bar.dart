import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic title;
  final List<Widget>? actions;
  final bool? centerTitle, withBackButton;
  final Color? backgroundColor;
  final double? elevation, height;
  final Widget? leading;
  final IconThemeData? iconTheme;
  final Brightness? brightness;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final List<Widget>? flexibleSpaceWidgets;
  final Widget? backgroundImage;

  const CustomAppBar(
      {super.key,
      this.title,
      this.actions,
      this.centerTitle,
      this.backgroundColor,
      this.elevation,
      this.leading,
      this.iconTheme,
      this.brightness,
      this.shadowColor,
      this.shape,
      this.flexibleSpaceWidgets,
      this.withBackButton,
      this.backgroundImage,
      this.height});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: centerTitle,
        backgroundColor: backgroundColor ?? AppColors.white,
        title: title is String
            ? Text(title,
                style: Styles.textStyle15_600.copyWith(color: AppColors.black0))
            : title,
        actions: actions,
        elevation: elevation ?? 0,
        leading: withBackButton != false && leading == null
            ? BackButton(color: AppColors.black0)
            : leading,
        iconTheme: iconTheme,
        shadowColor: shadowColor,
        shape: shape,
        flexibleSpace: Stack(fit: StackFit.expand, children: [
          if (backgroundImage != null) backgroundImage!,
          if (flexibleSpaceWidgets != null) ...flexibleSpaceWidgets!
        ]));
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}