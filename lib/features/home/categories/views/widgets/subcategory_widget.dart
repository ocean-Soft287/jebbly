import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/features/home/categories/views/widgets/subcategory_product.dart';

class SubcategoryWidget extends StatelessWidget {
  const SubcategoryWidget(
      {super.key, required this.title, required this.products});
  final String title;
  final List<SubcategoryProduct> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 17.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: Styles.textStyle15_600.copyWith(color: AppColors.black0)),
          Gap(16.h),
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100,
                  childAspectRatio: .61,
                  crossAxisSpacing: 23.5.w,
                  mainAxisSpacing: 0),
              itemCount: products.length,
              itemBuilder: (_, index) => products[index])
        ]));
  }
}