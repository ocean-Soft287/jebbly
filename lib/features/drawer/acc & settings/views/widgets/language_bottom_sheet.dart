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
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:jeebly_mobile/core/widgets/custom_image.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LocaleCubit>();
    final isArabic = cubit.state.languageCode == 'ar';
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 23.h),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
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
                if (selectedIndex != 0) {
                  setState(() {
                    selectedIndex = 0;
                  });
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
                        value: selectedIndex == 0 ||
                            (isArabic && selectedIndex == null),
                        onChanged: (_) {},
                        fillColor: WidgetStatePropertyAll(selectedIndex == 0 ||
                                (isArabic && selectedIndex == null)
                            ? AppColors.primary
                            : AppColors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(999999999999999))))
              ])),
          Gap(25.h),
          InkWell(
              onTap: () {
                if (selectedIndex != 1) {
                  setState(() {
                    selectedIndex = 1;
                  });
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
                        value: selectedIndex == 1 ||
                            (!isArabic && selectedIndex == null),
                        onChanged: (_) {},
                        fillColor: WidgetStatePropertyAll(selectedIndex == 1 ||
                                (!isArabic && selectedIndex == null)
                            ? AppColors.primary
                            : AppColors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(999999999999999))))
              ])),
          Gap(68.h),
          CustomButton(
              onPressed: () {
                selectedIndex == 0 ? cubit.toArabic() : cubit.toEnglish();
                GoRouter.of(context).pop();
              },
              text: AppLocalizations.of(context)!.confirm)
        ]));
  }
}