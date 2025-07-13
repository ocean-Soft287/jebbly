import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';

class SelectServiceAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SelectServiceAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        height: 63.h,
        leading: InkWell(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Icon(Icons.menu, color: AppColors.black0)),
        title: Column(children: [
          Text(AppLocalizations.of(context)!.delivery_to,
              style: Styles.textStyle10_500),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Gap(5.w),
            Text(AppLocalizations.of(context)!.home,
                style: Styles.textStyle12_600),
            CustomSVG(assetName: AppAssets.arrowDown)
          ])
        ]),
        actions: [Gap(40.w)]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}