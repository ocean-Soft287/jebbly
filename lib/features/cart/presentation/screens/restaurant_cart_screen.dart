import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/base_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../manager/restaurant_cart_bloc/restaurant_cart_bloc.dart';
import '../../manager/restaurant_cart_bloc/restaurant_cart_event.dart';
import '../../manager/restaurant_cart_bloc/restaurant_cart_state.dart';
import '../widgets/bill_summary_card.dart';
import '../widgets/cart_app_bar.dart';
import '../widgets/cart_checkout_bar.dart';
import '../widgets/cart_products_card.dart';
import '../widgets/recommendations_section.dart';
import '../widgets/restaurant_header_card.dart';
import '../widgets/store_note_section.dart';

class RestaurantCartScreen extends StatefulWidget {
  final int restaurantId;
  const RestaurantCartScreen({super.key, required this.restaurantId});

  @override
  State<RestaurantCartScreen> createState() => _RestaurantCartScreenState();
}

class _RestaurantCartScreenState extends State<RestaurantCartScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<RestaurantCartBloc>()
        .add(FetchRestaurantCart(widget.restaurantId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<RestaurantCartBloc, RestaurantCartState>(
          builder: (context, state) {
            if (state.status == Status.loading && state.restaurant == null) {
              return Column(
                children: [
                  const CartAppBar(),
                  Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              );
            }

            if (state.restaurant == null) {
              return Column(
                children: [
                  const CartAppBar(),
                  Expanded(
                    child: Center(
                      child: Text(
                        state.errorMessage.isEmpty
                            ? AppLocalizations.of(context)!.error
                            : state.errorMessage,
                      ),
                    ),
                  ),
                ],
              );
            }

            final restaurant = state.restaurant!;

            return Column(
              children: [
                const CartAppBar(),
                Expanded(
                  child: RefreshIndicator(
                    color: AppColors.primary,
                    onRefresh: () async {
                      context
                          .read<RestaurantCartBloc>()
                          .add(const RefreshRestaurantCart());
                      await context
                          .read<RestaurantCartBloc>()
                          .stream
                          .firstWhere((s) =>
                      s.status == Status.success ||
                          s.status == Status.failure);
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          RestaurantHeaderCard(restaurant: restaurant),
                          SizedBox(height: 16.h),
                          CartProductsCard(
                            products: restaurant.products,
                            restaurantId: restaurant.restaurantId,
                            onRemove: (id) => context
                                .read<RestaurantCartBloc>()
                                .add(RemoveProductFromCart(id)),
                            onQuantityChanged: (_) => context
                                .read<RestaurantCartBloc>()
                                .add(const RefreshRestaurantCart()),
                            onAddMore: () {
                              // الانتقال لقائمة منتجات المطعم
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(height: 16.h),
                          StoreNoteSection(
                            initialNote: state.storeNote,
                            onChanged: (v) => context
                                .read<RestaurantCartBloc>()
                                .add(UpdateStoreNote(v)),
                          ),
                          SizedBox(height: 24.h),
                          if (state.recommendations.isNotEmpty) ...[
                            RecommendationsSection(
                              products: state.recommendations,
                              onAdd: (id) => context
                                  .read<RestaurantCartBloc>()
                                  .add(AddRecommendedProduct(id)),
                            ),
                            SizedBox(height: 24.h),
                          ],
                          BillSummaryCard(bill: state.bill),
                          SizedBox(height: 100.h), // مساحة تحت للزر السفلي
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<RestaurantCartBloc, RestaurantCartState>(
        buildWhen: (p, c) => p.bill != c.bill || p.restaurant != c.restaurant,
        builder: (context, state) {
          if (state.isEmpty) return const SizedBox.shrink();
          return CartCheckoutBar(
            totalPrice: state.bill.total,
            onContinue: () {
              // TODO: navigate to checkout/address screen
            },
          );
        },
      ),
    );
  }
}