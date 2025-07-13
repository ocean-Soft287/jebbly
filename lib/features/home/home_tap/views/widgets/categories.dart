import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jeebly_mobile/core/widgets/item_single_image.dart';
import 'package:jeebly_mobile/features/home/home_tap/views/widgets/item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Item(
        title: AppLocalizations.of(context)!.categories,
        imageHeight: 62.h,
        itemImages: [
          ItemSingleImage(
              imageHeight: 62.h,
              imageUrl:
                  'https://simply-delicious-food.com/wp-content/uploads/2022/09/Breakfast-board28-500x375.jpg',
              imageWidth: 123.w,
              centerText: 'إفطار صباحي و عصائر طبيعية',
              type: 'category'),
          ItemSingleImage(
              imageHeight: 62.h,
              imageUrl:
                  'https://www.foodandwine.com/thmb/DI29Houjc_ccAtFKly0BbVsusHc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/crispy-comte-cheesburgers-FT-RECIPE0921-6166c6552b7148e8a8561f7765ddf20b.jpg',
              imageWidth: 123.w,
              centerText: 'برجر',
              type: 'category'),
          ItemSingleImage(
              imageHeight: 62.h,
              imageUrl:
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/1200px-Pizza-3007395.jpg',
              imageWidth: 123.w,
              centerText: 'البيتزا',
              type: 'category'),
          ItemSingleImage(
              imageHeight: 62.h,
              imageUrl:
                  'https://simply-delicious-food.com/wp-content/uploads/2022/09/Breakfast-board28-500x375.jpg',
              imageWidth: 123.w,
              centerText: 'إفطار صباحي و عصائر طبيعية',
              type: 'category'),
          ItemSingleImage(
              imageHeight: 62.h,
              imageUrl:
                  'https://simply-delicious-food.com/wp-content/uploads/2022/09/Breakfast-board28-500x375.jpg',
              imageWidth: 123.w,
              centerText: 'إفطار صباحي و عصائر طبيعية',
              type: 'category')
        ]);
  }
}