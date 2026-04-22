import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/flexible_image.dart';
import '../../models/general_cart_model.dart';

class CartProductThumbnail extends StatelessWidget {
  final CartProductModel product;
  const CartProductThumbnail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Stack(
        children: [
          // صورة المنتج
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: FlexibleImage(
              source: "https://jebbly.runasp.net${product.imageUrl}" ,
              width: 80.w,
              height: 80.w,
              fit: BoxFit.cover,
            ),
          ),
          // شارة الكمية أسفل الصورة
          Positioned(
            bottom: 4.h,
            left: 4.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Text(
                'x${product.quantity}',
                style: AppTextTheme.caption.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}