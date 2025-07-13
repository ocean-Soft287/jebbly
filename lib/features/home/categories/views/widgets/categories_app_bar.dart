import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/core/widgets/custom_search_bar.dart';
import 'package:jeebly_mobile/features/home/categories/views/widgets/categories_list.dart';

class CategoriesAppBar extends StatelessWidget {
  const CategoriesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    /*return Container(
        color: AppColors.white,
        padding: EdgeInsetsDirectional.only(bottom: 14.h, top: 24.h, end: 8.w),
        child: Column(children: [
          Row(children: [
            BackButton(),
            Text(AppLocalizations.of(context)!.categories,
                style: Styles.textStyle15.copyWith(color: AppColors.black0))
          ]),
          CustomDivider(),
          Gap(14.h),
          const CategoriesList()
        ]));*/

    return Container(
        color: AppColors.white,
        padding: EdgeInsetsDirectional.only(bottom: 14.h, top: 24.h, end: 8.w),
        child: Column(children: [
          Row(children: [
            const BackButton(),
            Expanded(
                child: CustomSearchBar(
                    hint: AppLocalizations.of(context)!
                        .search_for_restaurant_or_item))
          ]),
          const CustomDivider(),
          Gap(14.h),
          const CategoriesList(items: [
            'صنع في ليبيا',
            'مستلزمات الحلويات',
            'عطرية',
            'مستحضرات تجميل'
          ]),
          CustomDivider(height: 24.h),
          CategoriesList(items: [
          AppLocalizations.of(context)!.all,
            'شاي و قهوة',
            'ألبان',
            'مشروبات'
          ])]));
  }
}