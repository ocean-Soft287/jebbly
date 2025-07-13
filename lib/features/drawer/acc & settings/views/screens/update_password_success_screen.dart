import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:jeebly_mobile/core/widgets/custom_image.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdatePasswordSuccessScreen extends StatelessWidget {
  const UpdatePasswordSuccessScreen({super.key, this.fromProfile});
  final bool? fromProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: const CustomAppBar(),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(width: double.infinity),
          const CustomImage(imagePath: AppAssets.check),
          Gap(10.h),
          CustomText(
              fromProfile == true
                  ? AppLocalizations.of(context)!.password_updated_successfully
                  : AppLocalizations.of(context)!.password_changed_successfully,
              style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w700)),
          Gap(34.h),
          CustomButton(
              width: 130.w,
              onPressed: () => GoRouter.of(context).pop(),
              text: AppLocalizations.of(context)!.ok)
        ]));
  }
}