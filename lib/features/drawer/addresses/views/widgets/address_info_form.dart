import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_text_field.dart';
import 'package:jeebly_mobile/features/drawer/addresses/cubit/address_cubit.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';

import 'package:jeebly_mobile/features/drawer/addresses/data/model/address_model.dart';

class AddressInfoForm extends StatelessWidget {
  const AddressInfoForm({super.key, this.address});
  final AddressModel? address;

  @override
  Widget build(BuildContext context) {
    var cubit = AddressCubit.get(context);
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Form(
            key: cubit.formKey,
            child: Column(spacing: 11.h, children: [
              CustomTextField(
                  controller: cubit.locationController,
                  validator: (text) {
                    if (text?.trim() == null || text!.trim().isEmpty) {
                      return AppLocalizations.of(context)!.location_is_required;
                    }
                    return null;
                  },
                  onTap: () async {
                    final result = await GoRouter.of(context)
                        .push<Map<String, dynamic>>(RoutesNames.profileMap);
                    if (result != null) {
                      cubit.updateLocation(
                        address: result['address'] ?? '',
                        lat: result['lat'] ?? '',
                        lng: result['lng'] ?? '',
                      );
                    }
                  },
                  labelText: AppLocalizations.of(context)!.your_location,
                  suffixIcon: Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: CustomSVG(assetName: AppAssets.locationIV))),
              CustomTextField(
                  controller: cubit.titleController,
                  validator: (text) {
                    if (text?.trim() == null || text!.trim().isEmpty) {
                      return AppLocalizations.of(context)!
                          .location_title_is_required;
                    }
                    return null;
                  },
                  labelText:
                      AppLocalizations.of(context)!.determine_title_for_address,
                  suffixIcon: Icon(Icons.keyboard_arrow_down_outlined,
                      color: AppColors.grey1)),
              CustomTextField(
                  controller: cubit.detailsController,
                  labelText:
                      '${AppLocalizations.of(context)!.written_location_description} (${AppLocalizations.of(context)!.optional})')
            ])));
  }
}