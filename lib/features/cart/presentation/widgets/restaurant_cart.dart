import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/features/cart/presentation/widgets/product_thumbnail.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/flexible_image.dart';
import '../../manager/general_cart_bloc/general_cart_bloc.dart';
import '../../manager/general_cart_bloc/general_cart_event.dart';
import '../../models/general_cart_model.dart';
import 'view_cart_button.dart';

class CartRestaurantCard extends StatelessWidget {
  final GeneralCartModel restaurant;
  const CartRestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: EdgeInsets.all(12.w),
      child: Column(
        children: [
          _CardHeader(
            restaurant: restaurant,
            onDelete: () => _confirmDelete(context),
          ),
          SizedBox(height: 12.h),
          _ProductsRow(restaurant: restaurant),
          SizedBox(height: 12.h),
          ViewCartButton(
            totalQuantity: restaurant.totalQuantity,
            totalPrice: restaurant.totalPrice,
            onTap: () => _goToRestaurantCart(context),
          ),
        ],
      ),
    );
  }

  void _goToRestaurantCart(BuildContext context) {
    // انتقال إلى سلة المطعم المحددة
    context.pushNamed(
      'restaurantCart',
      pathParameters: {'restaurantId': restaurant.restaurantId.toString()},
    );
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('cart.delete_title'),
        content: Text(
          'cart.delete_message',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('common.cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('common.delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      context
          .read<GeneralCartBloc>()
          .add(RemoveRestaurantFromCart(restaurant.restaurantId));
    }
  }
}

class _CardHeader extends StatelessWidget {
  final GeneralCartModel restaurant;
  final VoidCallback onDelete;
  const _CardHeader({required this.restaurant, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // أيقونة الحذف على اليسار
        InkWell(
          onTap: onDelete,
          borderRadius: BorderRadius.circular(8.r),
          child: Padding(
            padding: EdgeInsets.all(6.w),
            child: Icon(
              Icons.delete_outline,
              color: Colors.grey.shade700,
              size: 22.sp,
            ),
          ),
        ),
        const Spacer(),
        // اسم المطعم + التقييم (يمين في RTL)
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              restaurant.restaurantName,
              style: AppTextTheme.body1.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.end,
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '(${restaurant.reviewsCount})',
                  style: AppTextTheme.caption
                      .copyWith(color: Colors.grey.shade600),
                ),
                SizedBox(width: 4.w),
                Text(
                  restaurant.rate.toStringAsFixed(1),
                  style: AppTextTheme.caption.copyWith(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 2.w),
                Icon(Icons.star, color: Colors.amber, size: 16.sp),
              ],
            ),
          ],
        ),
        SizedBox(width: 10.w),
        // شعار المطعم
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: FlexibleImage(
            source: restaurant.logo,
            width: 60.w,
            height: 60.w,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class _ProductsRow extends StatelessWidget {
  final GeneralCartModel restaurant;
  const _ProductsRow({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.separated(
        reverse: true, // RTL: العناصر تبدأ من اليمين
        scrollDirection: Axis.horizontal,
        itemCount: restaurant.products.length + 1, // +1 لزر الإضافة
        separatorBuilder: (_, __) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          if (index == 0) {
            // زر "إضافة" دائمًا في البداية (اليمين في RTL بسبب reverse)
            return _AddMoreTile(
              onTap: () {
                // الانتقال إلى شاشة قائمة منتجات المطعم لإضافة المزيد
                context.pushNamed(
                  'restaurantMenu',
                  pathParameters: {
                    'restaurantId': restaurant.restaurantId.toString(),
                  },
                );
              },
            );
          }
          final product = restaurant.products[index - 1];
          return CartProductThumbnail(product: product);
        },
      ),
    );
  }
}

class _AddMoreTile extends StatelessWidget {
  final VoidCallback onTap;
  const _AddMoreTile({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 80.w,
        height: 80.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 28.sp, color: Colors.grey.shade700),
            SizedBox(height: 4.h),
            Text(
              'cart.add',
              style: AppTextTheme.caption
                  .copyWith(color: Colors.grey.shade700, fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}