import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/dates_and_distance.dart';
import 'package:jeebly_mobile/core/widgets/product/delivery_toggle_button.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_data.dart';
import '../../manager/cubit/restaurant_cubit.dart';
import '../../manager/cubit/restaurant_state.dart';
import '../../models/restaurants_details_model.dart';

class RestaurantHeader extends StatelessWidget {
  final RestaurantDetailsModel restaurant;

  const RestaurantHeader({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Name ──
          Text(restaurant.nameAr, style: Styles.textStyle16_600),
          // ── Food type / address as subtitle ──
          Text(
            restaurant.foodType?.isNotEmpty == true
                ? restaurant.foodType!
                : restaurant.addressAr,
            style: Styles.textStyle16_300,
          ),

          Gap(13.h),

          // ── Delivery toggle ──
          BlocBuilder<RestaurantCubit, RestaurantState>(
            builder: (_, state) {
              final cubit = RestaurantCubit.get(context);
              return DeliveryToggleButton(cubit: cubit);
            },
          ),

          Gap(13.h),

          // ── Rate + tax ──
          RestaurantData(restaurant: restaurant),

          Gap(7.h),

          // ── Delivery time ──
          DatesAndDistance(
            restaurant: restaurant,
          ),
        ],
      ),
    );
  }
}
