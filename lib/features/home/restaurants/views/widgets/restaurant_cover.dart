import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_network_image.dart';

import '../../../../../core/http/endpoints.dart';

class RestaurantCover extends StatelessWidget {
  final String coverUrl;

  const RestaurantCover({super.key, required this.coverUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomNetworkImage(
        height: 155.h,
        width: double.infinity,
        url: "${Endpoints.baseUrl}$coverUrl", // ✅ real cover from API
      ),
      Container(
        margin: EdgeInsets.all(18.sp),
        decoration:
        BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
            maxHeight: 38.sp,
            maxWidth: 38.sp,
            minHeight: 38.sp,
            minWidth: 38.sp,
          ),
          onPressed: () => GoRouter.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      )
    ]);
  }
}