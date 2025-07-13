import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/widgets/custom_search_bar.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return CustomSearchBar(hint: index == 2?
    AppLocalizations.of(context)!.search_for_product_or_store:
    AppLocalizations.of(context)!.search_for_restaurant_or_item);
  }
}