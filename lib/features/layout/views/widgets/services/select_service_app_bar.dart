import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/features/drawer/addresses/bloc/addresses_bloc.dart';
import 'package:jeebly_mobile/features/drawer/addresses/data/model/address_model.dart';
import '../layout/address_selection_sheet.dart';

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
        title: InkWell(
          onTap: () => _showAddressDropdown(context),
          borderRadius: BorderRadius.circular(8.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            child: Column(children: [
              Text(AppLocalizations.of(context)!.delivery_to,
                  style: Styles.textStyle10_500),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Gap(5.w),
                BlocBuilder<AddressesBloc, BaseState<AddressModel>>(
                  builder: (context, state) {
                    return Text(state.data?.title ?? AppLocalizations.of(context)!.home,
                        style: Styles.textStyle12_600);
                  },
                ),
                CustomSVG(assetName: AppAssets.arrowDown)
              ])
            ]),
          ),
        ),
        actions: [Gap(40.w)]);
  }

  void _showAddressDropdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const AddressSelectionSheet();
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}