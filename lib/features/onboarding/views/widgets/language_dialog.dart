import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/helpers/localization/locale_cubit.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_image.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LocaleCubit>();
    final currentLocale = cubit.state;
    return AlertDialog(
        contentPadding: EdgeInsets.all(20.sp),
        backgroundColor: AppColors.white,
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () => GoRouter.of(context).pop(),
                icon: Icon(CupertinoIcons.xmark, size: 17.sp))
          ]),
          Gap(8.h),
          CustomText('لغة التطبيق (Language)',
              style: Styles.textStyle16_500.copyWith(color: AppColors.black0)),
          Gap(12.h),
          InkWell(
              onTap: () {
                if (currentLocale.languageCode == 'en') {
                  cubit.toArabic();
                  GoRouter.of(context).pop();
                }
              },
              child: Row(children: [
                CustomImage(imagePath: AppAssets.lybia, h: 15.h, w: 30.w),
                Gap(6.w),
                CustomText('العربية (Arabic)', style: Styles.textStyle16_300),
                const Spacer(),
                SizedBox(
                    height: 16.sp,
                    width: 16.sp,
                    child: Checkbox(
                        value: currentLocale.languageCode == 'ar',
                        onChanged: (_) {},
                        fillColor: currentLocale.languageCode == 'ar'
                            ? WidgetStatePropertyAll(AppColors.primary)
                            : null,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(999999999999999))))
              ])),
          Gap(25.h),
          InkWell(
              onTap: () {
                if (currentLocale.languageCode == 'ar') {
                  cubit.toEnglish();
                  GoRouter.of(context).pop();
                }
              },
              child: Row(children: [
                CustomImage(imagePath: AppAssets.uk, h: 15.h, w: 30.w),
                Gap(6.w),
                CustomText('الإنجليزي (English)',
                    style: Styles.textStyle16_300),
                const Spacer(),
                SizedBox(
                    height: 16.sp,
                    width: 16.sp,
                    child: Checkbox(
                        value: currentLocale.languageCode == 'en',
                        onChanged: (_) {},
                        fillColor: currentLocale.languageCode == 'en'
                            ? WidgetStatePropertyAll(AppColors.primary)
                            : null,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(999999999999999))))
              ]))
        ]));
  }
}