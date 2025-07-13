import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';

class ContinueWidget extends StatelessWidget {
  const ContinueWidget({super.key, required this.cubit, this.location});
  final dynamic cubit;
  final String? location;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 23.h),
        color: AppColors.white,
        child: Column(children: [
          Text(AppLocalizations.of(context)!.delivery_location,
              style: Styles.textStyle16_500),
          Gap(8.h),
          Text(cubit.deliveryLocation,
              style: Styles.textStyle16_500.copyWith(
                  color: AppColors.black0, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center),
          Gap(20.h),
          CustomButton(
              isActive: cubit.deliveryLocation.isNotEmpty,
              onPressed: () => location != null
                  ? {
                      GoRouter.of(context).pop(),
                      GoRouter.of(context)
                          .pushReplacement(location!, extra: true)
                    }
                  : GoRouter.of(context).go(RoutesNames.selectService),
              text: AppLocalizations.of(context)!.continue_text)
        ]));
  }
}