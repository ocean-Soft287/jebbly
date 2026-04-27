import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/extensions/context_extension.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/flexible_image.dart';
import '../../../../l10n/app_localizations.dart';
import '../../models/general_cart_model.dart';
import 'qty_selector.dart';

class CartProductTile extends StatelessWidget {
  final CartProductModel product;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const CartProductTile({
    super.key,
    required this.product,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final locale = context.isArabic;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: FlexibleImage(
              source: product.imageUrl ?? '',
              width: 70.w,
              height: 70.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.displayName(locale),
                  style: AppTextTheme.body1.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                  textAlign: TextAlign.end,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10.h),
                QtySelector(
                  quantity: product.quantity,
                  onIncrement: onIncrement,
                  onDecrement: onDecrement,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: onRemove,
                borderRadius: BorderRadius.circular(8.r),
                child: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.grey.shade700,
                    size: 20.sp,
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              Text(
                '${product.price.toStringAsFixed(0)} ${AppLocalizations.of(context)!.currency}',
                style: AppTextTheme.body1.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
