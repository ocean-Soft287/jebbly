import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key, required this.cubit});
  final dynamic cubit;

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Stack(children: [
      GoogleMap(
          initialCameraPosition: CameraPosition(
              target: cubit.currentP ?? LatLng(30.033333, 31.233334), zoom: 10),
          onMapCreated: (GoogleMapController controller) {
            cubit.mapController = controller;
          },
          markers: {
            if (cubit.currentP != null)
              Marker(
                  markerId: MarkerId("current"),
                  position: cubit.currentP!,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed))
          }),
      Positioned(
          bottom: 13.h,
          left: isArabic ? null : 13.w,
          right: isArabic ? 13.w : null,
          child: InkWell(
              onTap: () => cubit.detectMyLocation(),
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.r)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
                  child: Row(children: [
                    CustomSVG(assetName: AppAssets.myLocation),
                    Gap(4.w),
                    Text(AppLocalizations.of(context)!.locate_me,
                        style: Styles.textStyle13_600)
                  ]))))
    ]);
  }
}