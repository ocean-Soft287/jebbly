import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key,
      this.selected,
      required this.selectIcon,
      required this.unSelectIcon,
      required this.title,
      this.location,
      this.onTap});
  final bool? selected;
  final String selectIcon, unSelectIcon, title;
  final String? location;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap ??
            (location == null
                ? null
                : () => GoRouter.of(context).push(location!)),
        child: Container(
            decoration: BoxDecoration(
                color:
                    selected == true ? AppColors.ketchup0 : Colors.transparent,
                borderRadius: BorderRadius.circular(8.r)),
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 9.h),
            width: double.infinity,
            child: Row(children: [
              CustomSVG(
                  assetName: selected == true ? selectIcon : unSelectIcon),
              Gap(5.w),
              Text(title,
                  style: Styles.textStyle10_600.copyWith(
                      color: selected == true
                          ? AppColors.primary
                          : AppColors.black0))
            ])));
  }
}