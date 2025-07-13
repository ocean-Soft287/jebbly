import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/widgets/custom_network_image.dart';

class AdCard extends StatelessWidget {
  const AdCard({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push(RoutesNames.restaurantDetails),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 19.h),
        child: CustomNetworkImage(url: url, height: 130.h, width: double.infinity, radius: 16.r),
      ),
    );
  }
}