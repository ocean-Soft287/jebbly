import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../models/cart_bill_model.dart';

class BillSummaryCard extends StatelessWidget {
  final CartBillModel bill;
  const BillSummaryCard({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.bill,
          style: AppTextTheme.body1.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: [
              _BillRow(
                label: AppLocalizations.of(context)!.items_price,
                value: '${bill.itemsPrice.toStringAsFixed(0)} ${AppLocalizations.of(context)!.currency}',
              ),
              SizedBox(height: 10.h),
              _BillRow(
                label: AppLocalizations.of(context)!.delivery_fee,
                value: '${bill.deliveryFee.toStringAsFixed(2)} ${AppLocalizations.of(context)!.currency}',
              ),
              SizedBox(height: 10.h),
              _BillRow(
                label: AppLocalizations.of(context)!.service_fee,
                valueWidget: bill.isServiceFree
                    ? Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE7D3),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.free,
                    style: AppTextTheme.caption.copyWith(
                      color: AppColors.ketchup1,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ),
                )
                    : Text(
                  '${bill.serviceFee.toStringAsFixed(2)} ${AppLocalizations.of(context)!.currency}',
                  style: AppTextTheme.body1,
                ),
              ),
              SizedBox(height: 14.h),
              // فاصل زجزاج
              CustomPaint(
                size: Size.fromHeight(10.h),
                painter: _ZigzagPainter(color: Colors.grey.shade300),
              ),
              SizedBox(height: 14.h),
              _BillRow(
                label: AppLocalizations.of(context)!.total,
                value:
                '${bill.total.toStringAsFixed(2)} ${AppLocalizations.of(context)!.currency}',
                bold: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BillRow extends StatelessWidget {
  final String label;
  final String? value;
  final Widget? valueWidget;
  final bool bold;

  const _BillRow({
    required this.label,
    this.value,
    this.valueWidget,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = AppTextTheme.body1.copyWith(
      fontSize: 14.sp,
      fontWeight: bold ? FontWeight.bold : FontWeight.w500,
    );

    return Row(
      children: [
        Text(label, style: style),

        const Spacer(),
        valueWidget ?? Text(value ?? '', style: style),
      ],
    );
  }
}

class _ZigzagPainter extends CustomPainter {
  final Color color;
  _ZigzagPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    const step = 8.0;
    final path = Path()..moveTo(0, size.height / 2);
    for (double x = 0; x < size.width; x += step) {
      path.lineTo(x + step / 2, 0);
      path.lineTo(x + step, size.height / 2);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}