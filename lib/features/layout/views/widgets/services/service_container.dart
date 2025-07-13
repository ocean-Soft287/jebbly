import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServiceContainer extends StatelessWidget {
  const ServiceContainer(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image});
  final String title, subtitle, image;

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return InkWell(
        onTap: () => GoRouter.of(context).push(RoutesNames.layout,
            extra: title == AppLocalizations.of(context)!.jeebly_eat
                ? 0
                : title == AppLocalizations.of(context)!.jeebly_get
                    ? 1
                    : 2),
        child: Stack(children: [
          Container(
              width: 108.w,
              height: 102.h,
              decoration: BoxDecoration(
                  color: AppColors.grey0,
                  borderRadius: BorderRadius.circular(20.r)),
              padding: EdgeInsets.all(9.sp),
              child: Stack(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(title, style: Styles.textHeading14),
                  Text(subtitle,
                      style: Styles.textStyle14_300
                          .copyWith(color: AppColors.grey1))
                ]),
                if (title != AppLocalizations.of(context)!.jeebly_shop)
                  Positioned(
                      bottom: 0,
                      left: isArabic ? 0 : null,
                      right: isArabic ? null : 0,
                      child: CustomImage(imagePath: image))
              ])),
          if (title == AppLocalizations.of(context)!.jeebly_shop)
            Positioned(
                bottom: 0,
                left: isArabic ? 0 : null,
                right: isArabic ? null : 0,
                child: CustomImage(imagePath: image))
        ]));
  }
}