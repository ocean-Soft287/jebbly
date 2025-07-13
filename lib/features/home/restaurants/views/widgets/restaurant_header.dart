import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/features/home/restaurants/cubit/restaurant_cubit.dart';
import 'package:jeebly_mobile/features/home/restaurants/cubit/restaurant_state.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/dates_and_distance.dart';
import 'package:jeebly_mobile/core/widgets/product/delivery_toggle_button.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_data.dart';

class RestaurantHeader extends StatelessWidget {
  const RestaurantHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //======= Restaurant Titles =======//
          Text('ميلكا - عين زارة', style: Styles.textStyle16_600),
          Text('إفطار صباحي و عصائر طبيعية', style: Styles.textStyle16_300),
          //==================================================================//

          Gap(13.h),

          //======= Delivery Switch Button =======//
          BlocBuilder<RestaurantCubit, RestaurantState>(builder: (_, state) {
            var cubit = RestaurantCubit.get(context);
            return DeliveryToggleButton(cubit: cubit);
            },
          ),
          //==================================================================//

          Gap(13.h),

          //======= Restaurant Data =======//
          const RestaurantData(),
          //==================================================================//

          Gap(7.h),

          //======= Dates And Distance =======//
          const DatesAndDistance()
          //==================================================================//
        ]));
  }
}