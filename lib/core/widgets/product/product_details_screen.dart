import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/widgets/product/main_ingredients.dart';
import 'package:jeebly_mobile/core/widgets/product/product_cover.dart';
import 'package:jeebly_mobile/core/widgets/product/product_info.dart';
import 'package:jeebly_mobile/features/home/restaurants/views/widgets/cart_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, this.withIngredients});
  final bool? withIngredients;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          const ProductCover(),
          const ProductInfo(),
          const Gap(1),
          if (withIngredients != false) MainIngredients()
        ]),
        bottomSheet: CartBottomSheet(
            title: AppLocalizations.of(context)!.add_to_cart,
            onPressed: () =>
                GoRouter.of(context).push(RoutesNames.orderSummary)));
  }
}