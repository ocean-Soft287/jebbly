import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';

class ItemSingleImageFooter extends StatelessWidget {
  const ItemSingleImageFooter(
      {super.key,
      this.title,
      this.distance,
      this.subtitle,
      this.deliveryPrice,
      this.totalRating,
      this.rateCount,
      required this.width});
  final String? title,
      distance,
      subtitle,
      deliveryPrice,
      totalRating,
      rateCount;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            if (title != null) ...[
              CustomText(title!, style: Styles.textStyle12_600),
              const Spacer()
            ],
            if (distance != null) ...[
              CustomText(distance! + AppLocalizations.of(context)!.km,
                  style: Styles.textStyle10_300),
              Gap(6.w)
            ]
          ]),
          if (subtitle != null) Text(subtitle!, style: Styles.textStyle12_500),
          Row(children: [
            if (deliveryPrice != null) ...[
              CustomText(
                  '${AppLocalizations.of(context)!.delivery}: ${deliveryPrice == '0' ? AppLocalizations.of(context)!.free : '${deliveryPrice!}د.ل'}',
                  style:
                      Styles.textStyle12_500.copyWith(color: AppColors.black0)),
              if (totalRating != null || rateCount != null) Gap(6.w)
            ],
            if (totalRating != null || rateCount != null) ...[
              Icon(Icons.star, color: AppColors.yellow, size: 20.sp),
              if (totalRating != null)
                CustomText(totalRating!,
                    style: Styles.textStyle10_300
                        .copyWith(color: AppColors.black0)),
              if (rateCount != null)
                CustomText(' (${rateCount!})', style: Styles.textStyle10_300)
            ]
          ])
        ]));
  }
}