import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_image.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod(
      {super.key,
      required this.icon,
      required this.title,
      required this.index,
      required this.cubit,
      this.dotIcon});

  final String icon, title;
  final int index;
  final dynamic cubit;
  final bool? dotIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => cubit.selectPaymentMethod(index),
        child: Container(
            padding: EdgeInsets.all(12.sp),
            margin: EdgeInsetsDirectional.only(bottom: 5.h),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.r)),
            child: Row(children: [
              CustomImage(imagePath: icon),
              Gap(2.w),
              CustomText(title),
              const Spacer(),
              Icon(
                  cubit.selectedPaymentMethod != index
                      ? Icons.circle_outlined
                      : dotIcon == true
                          ? Icons.radio_button_checked_outlined
                          : Icons.check_circle_rounded,
                  color: cubit.selectedPaymentMethod == index
                      ? AppColors.primary
                      : AppColors.grey1)
            ])));
  }
}