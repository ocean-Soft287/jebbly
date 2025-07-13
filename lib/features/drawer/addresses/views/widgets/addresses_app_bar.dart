import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';

class AddressesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddressesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        title: AppLocalizations.of(context)!.my_addresses,
        actions: [
          IntrinsicWidth(
              child: CustomButton(
                  onPressed: () =>
                      GoRouter.of(context).push(RoutesNames.addEditAddress),
                  text: AppLocalizations.of(context)!.add_new_address,
                  margin: EdgeInsetsDirectional.only(
                      top: 7.h, bottom: 7.h, end: 15.w),
                  textStyle:
                      Styles.textStyle13_600.copyWith(color: AppColors.white)))
        ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}