import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/core/widgets/custom_search_bar.dart';
import 'package:jeebly_mobile/features/home/categories/views/widgets/categories_grid.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/layout/layout_app_bar.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/layout/layout_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LayoutAppBar(),
        drawer: LayoutDrawer(),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomDivider(),
          CustomSearchBar(
              hint:
                  AppLocalizations.of(context)!.search_for_restaurant_or_item),
          CustomDivider(),
          Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 12.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                AppLocalizations.of(context)!.browse_categories,
                                style: Styles.textStyle15_600
                                    .copyWith(color: AppColors.black0)),
                            CategoriesGrid()
                          ]))))
        ]));
  }
}