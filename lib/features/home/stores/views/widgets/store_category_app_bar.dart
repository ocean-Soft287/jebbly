import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/widgets/custom_button.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StoreCategoryAppBar extends StatelessWidget {
  const StoreCategoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        BackButton(),
        CustomText('سماعات'),
        Icon(Icons.keyboard_arrow_down)
      ]),
      CustomButton(
          onPressed: () {},
          text: AppLocalizations.of(context)!.all,
          height: 28.h,
          width: 73.w,
          borderRadius: 20.r,
          margin: EdgeInsetsDirectional.only(start: 24.w))
    ]);
  }
}