import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../core/theme/app_colors.dart';

class QtySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QtySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // زر الزيادة (+)
          _QtyButton(
            icon: Icons.add,
            onTap: onIncrement,
          ),
          SizedBox(width: 12.w),
          // الكمية الحالية
          Text(
            '$quantity',
            style: AppTextTheme.body1.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(width: 12.w),
          // زر الإنقاص (-)
          _QtyButton(
            icon: Icons.remove,
            onTap: onDecrement,
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6.r),
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Icon(
          icon,
          color: AppColors.ketchup1,
          size: 20.sp,
        ),
      ),
    );
  }
}