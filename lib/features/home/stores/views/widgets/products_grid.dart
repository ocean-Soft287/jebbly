import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/features/home/stores/views/widgets/category_product.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                childAspectRatio: .59,
                crossAxisSpacing: 23.5.w,
                mainAxisSpacing: 0),
            itemCount: 60,
            itemBuilder: (_, index) => CategoryProduct()));
  }
}