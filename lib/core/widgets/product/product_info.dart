import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.white,
        padding: EdgeInsets.all(18.sp),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomText('ميلكا عين زارة',
                style:
                    Styles.textStyle16_500.copyWith(color: AppColors.black0)),
            CustomText('25 د.ل',
                style: Styles.textStyle16_500.copyWith(color: AppColors.black0))
          ]),
          Gap(16.h),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
                onTap: () {
                  setState(() {
                    if (quantity > 1) quantity--;
                  });
                },
                child: Container(
                    height: 25.sp,
                    width: 25.sp,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.black0.withAlpha(50),
                              blurRadius: 3,
                              spreadRadius: 2,
                              offset: Offset(0, 0)
                          )
                        ],
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(3)
                    ),
                    child: Icon(Icons.remove, size: 17.sp))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: CustomText('$quantity', style: Styles.textStyle24_500)
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    quantity++;
                  });
                },
                child: Container(
                  height: 25.sp,
                    width: 25.sp,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black0.withAlpha(50),
                          blurRadius: 3,
                          spreadRadius: 2,
                          offset: Offset(0, 0)
                        )
                      ],
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(3)
                    ),
                    child: Icon(Icons.add, color: AppColors.primary, size: 17.sp)))
          ])
        ]));
  }
}