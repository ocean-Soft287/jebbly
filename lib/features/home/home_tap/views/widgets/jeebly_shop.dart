import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/all_stores.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/shop_sections_row.dart';

class JeeblyShop extends StatelessWidget {
  const JeeblyShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
            children: [const ShopSectionsRow(), Gap(33.h), const AllStores()]));
  }
}