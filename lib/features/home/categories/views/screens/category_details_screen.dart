import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/features/home/categories/views/widgets/categories_app_bar.dart';
import 'package:jeebly_mobile/features/home/categories/views/widgets/subcategory_product.dart';
import 'package:jeebly_mobile/features/home/categories/views/widgets/subcategory_widget.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<SubcategoryWidget> subcategories = [
      SubcategoryWidget(
          title: 'إفطار صباحي',
          products: [SubcategoryProduct(), SubcategoryProduct()]),
      SubcategoryWidget(title: 'ألبان', products: [
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct()
      ]),
      SubcategoryWidget(title: 'سلع أساسية', products: [
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct(),
        SubcategoryProduct()
      ])
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          CategoriesAppBar(),
          const CustomDivider(),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (_, i) => subcategories[i],
                  separatorBuilder: (_, i) => CustomDivider(),
                  itemCount: subcategories.length))
        ]));
  }
}