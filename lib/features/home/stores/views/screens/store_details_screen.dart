import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_search_bar.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:jeebly_mobile/features/home/categories/views/widgets/categories_grid.dart';
import 'package:jeebly_mobile/features/home/stores/views/widgets/store_header.dart';
import 'package:jeebly_mobile/features/home/stores/views/widgets/store_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StoreDetailsScreen extends StatelessWidget {
  const StoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Column(children: [
          const StoreHeader(),
          const StoreInfo(),
          CustomSearchBar(hint: AppLocalizations.of(context)!.search_in_store),
          Expanded(
              child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  children: [
                CustomText(AppLocalizations.of(context)!.browse_categories,
                    style: Styles.textStyle15_500),
                const CategoriesGrid(store: true)
              ]))
        ]));
  }
}