import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/features/home/restaurants/manager/restaurant_category_bloc/restaurant_category_event.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/cart_bottom_sheet.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_categories_bar.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_cover.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_header.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_products_list.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/restaurant_search.dart';

import '../../../../../core/widgets/pull_to_refresh.dart';
import '../../manager/product_bloc/product_bloc.dart';
import '../../models/product_model.dart';
import '../../../../../core/bloc/base_bloc.dart';
import '../../../../../core/service_locator/service_locator.dart';
import '../../manager/cubit/restaurant_cubit.dart';
import '../../manager/restaurant_category_bloc/restaurant_category_bloc.dart';
import '../../manager/restaurant_details_bloc/restaurant_details_bloc.dart';
import '../../manager/restaurant_details_bloc/restaurants_details_event.dart';
import '../../models/restaurants_details_model.dart';
import '../../../../../core/bloc/paginated_bloc/paginated_bloc.dart';
import '../../../../cart/manager/cart_cubit.dart';
import '../../../../cart/manager/restaurant_cart_bloc/restaurant_cart_bloc.dart';
import '../../../../cart/manager/restaurant_cart_bloc/restaurant_cart_event.dart';
import '../../../../../core/extensions/context_extension.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  final int restaurantId;

  const RestaurantDetailsScreen({super.key, required this.restaurantId});

  @override
  State<RestaurantDetailsScreen> createState() => _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  int? currentCategoryId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<RestaurantDetailsBloc>()
            ..add(FetchRestaurantDetails(restaurantId: widget.restaurantId)),
        ),
        BlocProvider(
          create: (_) => getIt<RestaurantCategoryBloc>()
            ..add(FetchRestaurantCategories(restaurantId: widget.restaurantId)),
        ),
        BlocProvider(
          create: (_) => getIt<RestaurantCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<ProductBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<CartCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<RestaurantCartBloc>()
            ..add(FetchRestaurantCart(widget.restaurantId)),
        ),
      ],
      child: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartSuccess) {
            context.showTopSnackBar(
              message: state.message,
              backgroundColor: Colors.green,
              icon: Icons.check_circle,
            );
          } else if (state is CartFailure) {
            context.showTopSnackBar(
              message: state.message,
              backgroundColor: Colors.red,
              icon: Icons.error,
            );
          }
        },
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
          final restaurant = state.items.isNotEmpty ? state.items.first : null;

          if (restaurant == null) return const SizedBox.shrink();

          return Scaffold(
            backgroundColor: AppColors.white,
            body: BlocBuilder<ProductBloc, BaseState<ProductModel>>(
              builder: (context, productState) {
                return PullToRefresh(
                  enableRefresh: true,
                  enableLoadMore: !productState.hasReachedMax,
                  onRefresh: () async {
                    context.read<RestaurantDetailsBloc>().add(FetchRestaurantDetails(restaurantId: widget.restaurantId));
                    context.read<RestaurantCategoryBloc>().add(FetchRestaurantCategories(restaurantId: widget.restaurantId));
                    if (currentCategoryId != null) {
                      context.read<ProductBloc>().add(LoadFirstPage(params: {
                        'restaurantId': widget.restaurantId,
                        'categoryId': currentCategoryId,
                      }));
                    }
                  },
                  onLoadMore: () async {
                    context.read<ProductBloc>().add(LoadNextPage());
                  },
                  builder: (controller) {
                    return ListView(
                      controller: controller,
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        RestaurantCover(coverUrl: restaurant.coverUrl),
                        RestaurantHeader(restaurant: restaurant),
                        const CustomDivider(),
                        RestaurantSearch(restaurantId: widget.restaurantId),
                        
                        // Categories Bar
                        RestaurantCategoriesBar(
                          onCategorySelected: (categoryId) {
                            currentCategoryId = categoryId;
                            context.read<ProductBloc>().add(LoadFirstPage(params: {
                              'restaurantId': widget.restaurantId,
                              'categoryId': categoryId,
                            }));
                          },
                        ),
                        
                        const CustomDivider(),
                        
                        RestaurantProductsList(
                          restaurantId: widget.restaurantId,
                          categoryId: currentCategoryId ?? 0,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            bottomSheet: CartBottomSheet(

              onPressed: (){
                context.push(RoutesNames.restaurantCart, extra: widget.restaurantId);
              },
            ),
          );
        },
      ),
    ));
  }
}