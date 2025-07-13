import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:restart_app/restart_app.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r)),
            padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 20.h),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              CustomText(AppLocalizations.of(context)!.alert,
                  style: Styles.textStyle14_500),
              Gap(28.h),
              CustomText(
                  AppLocalizations.of(context)!
                      .are_u_sure_u_wanna_delete_ur_acc,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle14_500),
              Gap(4.h),
              CustomText(
                  AppLocalizations.of(context)!
                      .account_deletion_will_result_in_all_related_data_deletion,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle14_500),
              Gap(49.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    onPressed: () => GoRouter.of(context).pop(),
                    child: CustomText(AppLocalizations.of(context)!.go_back,
                        style: Styles.textStyle12_500
                            .copyWith(color: AppColors.green1))),
                TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    onPressed: () => Restart.restartApp(),
                    child: CustomText(AppLocalizations.of(context)!.delete,
                        style: Styles.textStyle12_500
                            .copyWith(color: AppColors.primary)))
              ])
            ])));
  }
}