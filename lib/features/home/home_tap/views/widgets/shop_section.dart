import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_network_image.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';

class ShopSection extends StatelessWidget {
  const ShopSection({super.key, required this.image, required this.title});
  final String image, title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(children: [
      CustomNetworkImage(
          width: (width - 73) / 3, height: 142.h, url: image, radius: 14.r),
      Gap(4.h),
      SizedBox(
          width: (width - 73) / 3,
          child: CustomText(title,
              style: Styles.textStyle10_600,
              maxLines: 2,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center))
    ]);
  }
}