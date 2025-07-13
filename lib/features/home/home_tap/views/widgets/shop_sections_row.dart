import 'package:flutter/material.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/shop_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopSectionsRow extends StatelessWidget {
  const ShopSectionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      ShopSection(
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxEyZK1-ktc6KQhS9lRjKfc8-fQ88lD5WlcA&s',
          title: AppLocalizations.of(context)!.offers),
      ShopSection(
          image:
              'https://www.lethalcosmetics.com/wp-content/themes/lethalcosmetics//images/dexter-launch.jpg',
          title: AppLocalizations.of(context)!.cosmetics),
      ShopSection(
          image:
              'https://images-cdn.ubuy.com.eg/6356b3a5c2926a7d140892e4-a-beautiful-high-quality-living-room.jpg',
          title: AppLocalizations.of(context)!.furniture_and_home_accessories)
    ]);
  }
}