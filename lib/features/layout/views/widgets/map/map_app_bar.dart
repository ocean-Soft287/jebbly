import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MapAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MapAppBar({super.key, required this.cubit});
  final dynamic cubit;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
        withBackButton: false,
        title: SizedBox(
            height: 43.h,
            width: double.infinity,
            child: SearchBar(
              controller: cubit.searchController,
                elevation: WidgetStatePropertyAll(0),
                backgroundColor: WidgetStatePropertyAll(AppColors.grey0),
                hintText: AppLocalizations.of(context)!.search_city_street,
                hintStyle: WidgetStatePropertyAll(Styles.textStyle16_500),
                leading: InkWell(
                    onTap: () => cubit.searchLocation(null),
                    child: Icon(Icons.search, color: AppColors.black1)),
                textInputAction: TextInputAction.search,
                onSubmitted: (location) => cubit.searchLocation(location))));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}