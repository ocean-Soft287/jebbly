import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/cart_bottom_sheet.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_cover.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_header.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_products_list.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_search.dart';

import '../../../../../core/bloc/base_bloc.dart';
import '../../../../../core/service_locator/service_locator.dart';
import '../../manager/cubit/restaurant_cubit.dart';
import '../../manager/restaurant_details_bloc/restaurant_details_bloc.dart';
import '../../manager/restaurant_details_bloc/restaurants_details_event.dart';
import '../../models/restaurants_details_model.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final String restaurantId;

  const RestaurantDetailsScreen({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<RestaurantDetailsBloc>()
            ..add(FetchRestaurantDetails(restaurantId: restaurantId)),
        ),
        BlocProvider(
          create: (_) => getIt<RestaurantCubit>(),
        ),
      ],
      child: BlocBuilder<RestaurantDetailsBloc, BaseState<RestaurantDetailsModel>>(
        builder: (context, state) {
          // ── Loading ──
          if (state.status == Status.loading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // ── Failure ──
          if (state.status == Status.failure) {
            return Scaffold(
              body: Center(child: Text(state.errorMessage ?? 'حدث خطأ')),
            );
          }

          // ── Success ──
          final restaurant =
          state.items.isNotEmpty ? state.items.first : null;

          if (restaurant == null) return const SizedBox.shrink();

          return Scaffold(
            backgroundColor: AppColors.white,
            body: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                RestaurantCover(coverUrl: restaurant.coverUrl),
                RestaurantHeader(restaurant: restaurant),
                const CustomDivider(),
                RestaurantSearch(restaurantId: restaurantId),
                const RestaurantProductsList(),
              ],
            ),
            bottomSheet: const CartBottomSheet(),
          );
        },
      ),
    );
  }
}