import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/counter_box.dart';
import 'package:jeebly_mobile/core/widgets/custom_network_image.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';

class RestaurantProduct extends StatelessWidget {
  const RestaurantProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push(RoutesNames.productDetails),
      child: Padding(
          padding: EdgeInsets.all(16.sp),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(children: [
              CustomText('ميلك شيك شيكولاتة', style: Styles.textStyle16_600),
              Gap(12.h),
              CustomText('12 د.ل', style: Styles.textStyle16_600),
            ]),
            Stack(children: [
              Column(children: [
                Gap(6.h),
                CustomNetworkImage(
                    url:
                        'https://preppykitchen.com/wp-content/uploads/2021/04/Milkshake-Recipe-Card.jpg',
                    width: 100.w,
                    height: 90.h)
              ]),
              CounterBox()
            ])
          ])),
    );
  }
}