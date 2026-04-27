import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../models/general_cart_model.dart';
import 'cart_product_tile.dart';

class CartProductsCard extends StatelessWidget {
  final List<CartProductModel> products;
  final int restaurantId;
  final void Function(int productId) onRemove;
  final VoidCallback onAddMore;
  final ValueChanged<int>? onQuantityChanged;

  const CartProductsCard({
    super.key,
    required this.products,
    required this.restaurantId,
    required this.onRemove,
    required this.onAddMore,
    this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // المنتجات
          ...List.generate(products.length, (i) {
            final p = products[i];
            return Column(
              children: [
                CartProductTile(
                  product: p,
                  restaurantId: restaurantId,
                  onRemove: () => onRemove(p.productId),
                  onQuantityChanged: onQuantityChanged,
                ),
                if (i < products.length - 1)
                  Divider(height: 1, color: Colors.grey.shade200),
              ],
            );
          }),
          Divider(height: 1, color: Colors.grey.shade200),
          // زر إضافة عناصر
          InkWell(
            onTap: onAddMore,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: AppColors.ketchup1,
                    size: 22.sp,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    AppLocalizations.of(context)!.add_items,
                    style: AppTextTheme.body1.copyWith(
                      color: AppColors.ketchup1,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}