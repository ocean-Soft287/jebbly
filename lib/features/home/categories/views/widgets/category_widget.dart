import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_network_image.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, this.store});
  final bool? store;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => GoRouter.of(context).push(store == true
            ? RoutesNames.storeCategoryDetails
            : RoutesNames.categoryDetails),
        child: Column(children: [
          CustomNetworkImage(
              url:
                  'https://www.investopedia.com/thmb/_deXeEfrR5-J08LJV_Koif06X1M=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-2152528658-14ea765b763d42d185c639b7a9d637c2.jpg'),
          Gap(4.h),
          Text('صنع في ليبيا',
              style: Styles.textStyle10_600, overflow: TextOverflow.ellipsis)
        ]));
  }
}