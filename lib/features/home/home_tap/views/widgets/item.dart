import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/item_single_image.dart';

class Item extends StatelessWidget {
  const Item(
      {super.key,
      required this.title,
      required this.imageHeight,
      required this.itemImages, this.withFooter});
  final String title;
  final double imageHeight;
  final List<ItemSingleImage> itemImages;
  final bool? withFooter;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: Styles.textStyle15_600.copyWith(color: AppColors.black0)),
      Gap(6.h),
      SizedBox(
          height: withFooter == true? imageHeight + 60.h: imageHeight,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => itemImages[index],
              separatorBuilder: (_, index) => Gap(9.w),
              itemCount: itemImages.length))
    ]);
  }
}