import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';
import 'package:jeebly_mobile/features/fav/views/screens/fav_tap.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/screens/home_screen.dart';
import 'package:jeebly_mobile/features/layout/cubit/layout/layout_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/features/my_orders/views/screens/my_orders_tap.dart';
import 'package:jeebly_mobile/features/offers/views/screens/offers_tap.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(BuildContext context) => BlocProvider.of(context);

  int homeIndex = 0;
  int selectedIndex = 0;

  /// Getter to always return an updated list of screens
  List<Widget> get screens => [
        HomeScreen(index: homeIndex), // ✅ homeIndex is now properly handled
        FavTap(),
        OffersTap(),
        MyOrdersTap()
      ];

  /// Updates home index and refreshes the home screen
  void setHomeIndex(int index) {
    homeIndex = index;
    emit(HomeChangedState());
  }

  /// Updates selected bottom navigation index
  void selectItem(int index) {
    if (selectedIndex != index) {
      selectedIndex = index;
      emit(TapChangedState());
    }
  }

  /// Bottom navigation bar items
  List<BottomNavigationBarItem> items(BuildContext context) => [
        BottomNavigationBarItem(
            icon: CustomSVG(
                assetName: selectedIndex == 0
                    ? AppAssets.activeExplore
                    : AppAssets.inactiveExplore),
            label: AppLocalizations.of(context)!.home_ii),
        BottomNavigationBarItem(
            icon: CustomSVG(
                assetName: selectedIndex == 1
                    ? AppAssets.activeHeart
                    : AppAssets.inactiveHeart),
            label: AppLocalizations.of(context)!.fav),
        BottomNavigationBarItem(
            icon: CustomSVG(
                assetName: selectedIndex == 2
                    ? AppAssets.activeOffers
                    : AppAssets.inactiveOffers),
            label: AppLocalizations.of(context)!.offers),
        BottomNavigationBarItem(
            icon: CustomSVG(
                assetName: selectedIndex == 3
                    ? AppAssets.cart
                    : AppAssets.inactiveOrders),
            label: AppLocalizations.of(context)!.my_orders)
      ];
}