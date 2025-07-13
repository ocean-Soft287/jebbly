import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddressDetailsHeader extends StatelessWidget {
  const AddressDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomSVG(assetName: AppAssets.locationIII),
      CustomText(AppLocalizations.of(context)!.additional_location_data,
          style: Styles.textStyle24_500),
      CustomText(
          AppLocalizations.of(context)!
              .your_geographic_location_determines_the_services_available_in_your_area,
          style: Styles.textStyle11_300,
          textAlign: TextAlign.center)
    ]);
  }
}