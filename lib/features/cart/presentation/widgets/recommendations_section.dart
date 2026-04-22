import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/extensions/context_extension.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/flexible_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../models/general_cart_model.dart';

class RecommendationsSection extends StatelessWidget {
  final List<CartProductModel> products;
  final void Function(int productId) onAdd;

  const RecommendationsSection({
    super.key,
    required this.products,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          AppLocalizations.of(context)!.recommended_for_you,
          style: AppTextTheme.body1.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 160.h,
          child: ListView.separated(
            reverse: true, // RTL
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (_, __) => SizedBox(width: 10.w),
            itemBuilder: (_, i) {
              final p = products[i];
              return _RecommendedTile(
                product: p,
                onAdd: () => onAdd(p.productId),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _RecommendedTile extends StatelessWidget {
  final CartProductModel product;
  final VoidCallback onAdd;

  const _RecommendedTile({required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final locale = context.isArabic;

    return SizedBox(
      width: 110.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 110.w,
                height: 110.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: FlexibleImage(
                    source: product.imageUrl ?? '',
                    width: 110.w,
                    height: 110.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // زر الإضافة في أسفل-يسار الصورة
              Positioned(
                bottom: -2,
                left: -2,
                child: InkWell(
                  onTap: onAdd,
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.add,
                      color: AppColors.ketchup1,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            product.displayName(locale),
            style: AppTextTheme.caption.copyWith(fontSize: 13.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h),
          Text(
            '${product.price.toStringAsFixed(0)} ${AppLocalizations.of(context)!.currency}',
            style: AppTextTheme.caption.copyWith(
              color: Colors.grey.shade600,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}