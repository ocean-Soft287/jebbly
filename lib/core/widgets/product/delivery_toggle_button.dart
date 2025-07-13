import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeliveryToggleButton extends StatelessWidget {
  const DeliveryToggleButton({super.key, required this.cubit});
  final dynamic cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 57.h,
        decoration: BoxDecoration(
            color: AppColors.grey0, borderRadius: BorderRadius.circular(30.r)),
        child: Row(children: [
          Expanded(
              child: InkWell(
                  onTap: () =>
                      cubit.deliverySelected ? null : cubit.toggleDelivery(),
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      height: 51,
                      decoration: BoxDecoration(
                          color: cubit.deliverySelected
                              ? AppColors.primary
                              : AppColors.grey0,
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Center(
                          child: CustomText(
                              AppLocalizations.of(context)!.delivery_service,
                              style: Styles.textStyle16_500.copyWith(
                                  color: cubit.deliverySelected
                                      ? AppColors.white
                                      : AppColors.black0),
                              textAlign: TextAlign.center))))),
          Expanded(
              child: InkWell(
                  onTap: () =>
                      cubit.deliverySelected ? cubit.toggleDelivery() : null,
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      height: 51,
                      decoration: BoxDecoration(
                          color: cubit.deliverySelected
                              ? AppColors.grey0
                              : AppColors.primary,
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Center(
                          child: CustomText(
                              AppLocalizations.of(context)!
                                  .receive_from_restaurant,
                              style: Styles.textStyle16_500.copyWith(
                                  color: cubit.deliverySelected
                                      ? AppColors.black0
                                      : AppColors.white),
                              textAlign: TextAlign.center)))))
        ]));
  }
}