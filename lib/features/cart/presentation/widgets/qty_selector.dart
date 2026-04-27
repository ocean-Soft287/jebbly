import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/bloc/base_bloc.dart';
import '../../../../../core/service_locator/service_locator.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../core/theme/app_colors.dart';
import '../../manager/update_quantity_cubit/update_quantity_cubit.dart';

class QtySelector extends StatelessWidget {
  final int quantity;
  final int productId;
  final int restaurantId;
  final ValueChanged<int>? onChanged;

  const QtySelector({
    super.key,
    required this.quantity,
    required this.productId,
    required this.restaurantId,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdateQuantityCubit>(
      create: (_) => getIt<UpdateQuantityCubit>(),
      child: BlocConsumer<UpdateQuantityCubit, BaseState<int>>(
        listener: (context, state) {
          if (state.isSuccess && state.data != null) {
            onChanged?.call(state.data!);
          }
        },
        builder: (context, state) {
          final cubit = context.read<UpdateQuantityCubit>();
          final isLoading = state.isLoading;

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
                _QtyButton(
                  icon: Icons.add,
                  onTap: isLoading
                      ? null
                      : () => cubit.increment(
                            productId: productId,
                            currentQuantity: quantity,
                          ),
                ),
                SizedBox(width: 12.w),
                Text(
                  '$quantity',
                  style: AppTextTheme.body1.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                _QtyButton(
                  icon: Icons.remove,
                  onTap: isLoading
                      ? null
                      : () => cubit.decrement(
                            productId: productId,
                            currentQuantity: quantity,
                            restaurantId: restaurantId,
                          ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
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
