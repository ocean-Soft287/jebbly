import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';
import 'package:jeebly_mobile/features/drawer/addresses/data/model/address_model.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';

import 'package:jeebly_mobile/features/drawer/addresses/bloc/addresses_bloc.dart';
import 'package:jeebly_mobile/features/drawer/addresses/bloc/addresses_event.dart';

class AddressCard extends StatefulWidget {
  const AddressCard({super.key, required this.address});

  final AddressModel address;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
              borderRadius: _isExpanded
                  ? BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      topLeft: Radius.circular(10.r))
                  : BorderRadius.circular(10.r),
              color: AppColors.white),
          child: ListTile(
              leading:
                  Icon(Icons.check_circle_rounded, color: AppColors.primary),
              title: Text(widget.address.title ?? '',
                  style: Styles.textStyle15_600
                      .copyWith(color: AppColors.black0)),
              subtitle: Text(widget.address.details ?? '',
                  style: Styles.textStyle11_300),
              trailing: IconButton(
                  onPressed: () =>
                      setState(() => _isExpanded = !_isExpanded),
                  icon: const Icon(Icons.keyboard_arrow_down)))),
      if (_isExpanded) ...[
        CustomDivider(),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 12.h),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r))),
            child: Row(children: [
              TextButton.icon(
                  onPressed: () {
                    if (widget.address.id != null) {
                      context
                          .read<AddressesBloc>()
                          .add(DeleteAddressEvent(widget.address.id!));
                    }
                  },
                  label: Text(AppLocalizations.of(context)!.delete,
                      style: Styles.textStyle13_600
                          .copyWith(color: AppColors.primary)),
                  icon: CustomSVG(assetName: AppAssets.delete)),
              TextButton.icon(
                  onPressed: () => GoRouter.of(context)
                      .push(RoutesNames.addEditAddress, extra: widget.address)
                      .then((_) => context
                          .read<AddressesBloc>()
                          .add(const GetAddressesEvent())),
                  label: Text(AppLocalizations.of(context)!.edit,
                      style: Styles.textStyle13_600
                          .copyWith(color: AppColors.black0)),
                  icon: CustomSVG(assetName: AppAssets.edit))
            ]))
      ]
    ]);
  }
}