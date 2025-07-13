import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';

class ResultsHeaderText extends StatelessWidget {
  const ResultsHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.only(start: 24.w, top: 16.h, bottom: 24.h),
        child: Text('${AppLocalizations.of(context)!.results}(22)',
            style: Styles.textStyle15_600.copyWith(color: AppColors.black0)));
  }
}