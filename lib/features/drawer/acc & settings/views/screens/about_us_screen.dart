import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/core/widgets/custom_image.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_cubit.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AccountCubit.get(context);
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: const CustomAppBar(),
        body: Column(children: [
          const CustomDivider(),
          const Spacer(),
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primary),
              height: 130.sp,
              width: 130.sp,
              padding: EdgeInsets.only(top: 10.h),
              child: CustomImage(imagePath: AppAssets.logoPng)),
          Gap(42.h),
          CustomText('${AppLocalizations.of(context)!.jeebly_version} 7.30.0',
              style: Styles.textStyle24_600),
          CustomText(AppLocalizations.of(context)!.jeebly_about,
              style: Styles.textStyle16_300),
          Gap(200.h),
          Row(
              spacing: 45.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () => cubit.goToFacebookPage(),
                    child: CustomSVG(assetName: AppAssets.facebook)),
                CustomSVG(assetName: AppAssets.x)
              ]),
          Gap(46.h),
          TextButton(
              onPressed: () => GoRouter.of(context)
                  .push(RoutesNames.termsAndConditions),
              child: CustomText(
                  AppLocalizations.of(context)!.terms_and_conditions,
                  style: Styles.textStyle15_600)),
          const Spacer()
        ]));
  }
}
