import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';

class SingleStatus extends StatelessWidget {
  const SingleStatus(
      {super.key, required this.inProgress, required this.title});
  final bool inProgress;
  final String title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return SizedBox(
        width: width / 6,
        child: Column(children: [
          Stack(children: [
            Container(
                width: width / 6,
                height: 5.h,
                decoration: BoxDecoration(
                    color: AppColors.grey0,
                    borderRadius: BorderRadius.circular(5.r))),
            if (inProgress)
              Positioned(
                  left: isArabic ? null : 0,
                  right: isArabic ? 0 : null,
                  child: Container(
                      width: width / 12,
                      height: 5.h,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(5.r))))
          ]),
          Gap(4.h),
          CustomText(
            title,
            style: Styles.textStyle11_300
                .copyWith(color: inProgress ? AppColors.primary : null),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: isArabic ? TextAlign.right : TextAlign.left,
          )
        ]));
  }
}