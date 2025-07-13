import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/features/home/categories/views/widgets/categories_grid.dart';

class JeeblyGet extends StatelessWidget {
  const JeeblyGet({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 30.w, vertical: 12.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          AppLocalizations.of(context)!.browse_based_on_category,
                          style: Styles.textStyle15_600
                              .copyWith(color: AppColors.black0)),
                      CategoriesGrid()
                    ]))));
  }
}
