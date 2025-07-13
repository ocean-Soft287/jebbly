import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/features/home/categories/views/widgets/category_widget.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key, this.store});
  final bool? store;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsetsDirectional.only(top: 12.h),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            childAspectRatio: .61,
            crossAxisSpacing: 23.5.w,
            mainAxisSpacing: 0),
        itemCount: 60,
        itemBuilder: (_, index) => CategoryWidget(store: store));
  }
}