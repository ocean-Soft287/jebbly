import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => GoRouter.of(context).push(RoutesNames.changePassword),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.white),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 11.h),
            child: Row(children: [
              CustomSVG(assetName: AppAssets.key),
              Gap(11.w),
              Text(AppLocalizations.of(context)!.change_password)
            ])));
  }
}