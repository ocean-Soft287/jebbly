import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/counter_box.dart';
import 'package:jeebly_mobile/core/widgets/custom_network_image.dart';

class SubcategoryProduct extends StatelessWidget {
  const SubcategoryProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Stack(alignment: Alignment.bottomCenter, children: [
        CustomNetworkImage(
            height: 91.h,
            width: 107.w,
            url:
                'https://images.contentstack.io/v3/assets/bltcedd8dbd5891265b/blt02cf680667522d24/66707e8470fb6fb1b0d72705/types-of-cheese-hero.jpg?q=70&width=3840&auto=webp'),
        Align(alignment: Alignment.bottomCenter, child: const CounterBox())
      ]),
      Gap(4.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('25 د.ل', style: Styles.textStyle13_500.copyWith(color: AppColors.black0)),
          Text('-800 غ-', style: Styles.textStyle10_300)
        ]
      ),
      Text('جبنة رومي', style: Styles.textStyle10_300)
    ]);
  }
}