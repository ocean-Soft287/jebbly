import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';

class ServicesSearch extends StatelessWidget {
  const ServicesSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 16.h),
        child: SizedBox(
          height: 43.h,
          width: double.infinity,
          child: SearchBar(
              elevation: WidgetStatePropertyAll(0),
              backgroundColor: WidgetStatePropertyAll(AppColors.grey0),
              leading: Icon(Icons.search),
              hintText: AppLocalizations.of(context)!.search_in_jeebly,
              hintStyle: WidgetStatePropertyAll(Styles.textStyle16_500)),
        ));
  }
}