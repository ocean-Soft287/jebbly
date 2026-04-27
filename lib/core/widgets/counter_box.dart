import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/core/service_locator/service_locator.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:jeebly_mobile/features/cart/manager/cart_cubit.dart';
import 'package:jeebly_mobile/features/cart/manager/update_quantity_cubit/update_quantity_cubit.dart';

class CounterBox extends StatefulWidget {
  const CounterBox({
    super.key,
    this.initialCount,
    this.productId,
    this.restaurantId,
    this.onIncrement,
    this.onDecrement,
    this.onChanged,
  });

  final int? initialCount;
  final int? productId;
  final int? restaurantId;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final ValueChanged<int>? onChanged;

  @override
  State<CounterBox> createState() => _CounterBoxState();
}

class _CounterBoxState extends State<CounterBox> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialCount ?? 0;
  }

  @override
  void didUpdateWidget(covariant CounterBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialCount != null &&
        widget.initialCount != oldWidget.initialCount &&
        widget.initialCount != _counter) {
      _counter = widget.initialCount!;
    }
  }

  bool get _hasApi => widget.productId != null && widget.restaurantId != null;

  @override
  Widget build(BuildContext context) {
    if (!_hasApi) {
      return _box(
        isLoading: false,
        onIncrement: _localIncrement,
        onDecrement: _localDecrement,
      );
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(create: (_) => getIt<CartCubit>()),
        BlocProvider<UpdateQuantityCubit>(
          create: (_) => getIt<UpdateQuantityCubit>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CartCubit, CartState>(
            listener: (_, state) {
              if (state is CartSuccess) {
                setState(() => _counter = 1);
                widget.onIncrement?.call();
                widget.onChanged?.call(1);
              }
            },
          ),
          BlocListener<UpdateQuantityCubit, BaseState<int>>(
            listener: (_, state) {
              if (state.isSuccess && state.data != null) {
                final newQty = state.data!;
                final wasIncrement = newQty > _counter;
                setState(() => _counter = newQty);
                if (wasIncrement) {
                  widget.onIncrement?.call();
                } else {
                  widget.onDecrement?.call();
                }
                widget.onChanged?.call(newQty);
              }
            },
          ),
        ],
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, cartState) {
            return BlocBuilder<UpdateQuantityCubit, BaseState<int>>(
              builder: (context, updateState) {
                final isLoading =
                    cartState is CartLoading || updateState.isLoading;
                return _box(
                  isLoading: isLoading,
                  onIncrement: () => _apiIncrement(context),
                  onDecrement: () => _apiDecrement(context),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _localIncrement() {
    setState(() => _counter++);
    widget.onIncrement?.call();
  }

  void _localDecrement() {
    if (_counter > 0) {
      setState(() => _counter--);
      widget.onDecrement?.call();
    }
  }

  void _apiIncrement(BuildContext context) {
    if (_counter == 0) {
      context.read<CartCubit>().addToCart(
            productId: widget.productId!,
            quantity: 1,
          );
    } else {
      context.read<UpdateQuantityCubit>().increment(
            productId: widget.productId!,
            currentQuantity: _counter,
          );
    }
  }

  void _apiDecrement(BuildContext context) {
    if (_counter <= 0) return;
    context.read<UpdateQuantityCubit>().decrement(
          productId: widget.productId!,
          currentQuantity: _counter,
          restaurantId: widget.restaurantId!,
        );
  }

  Widget _box({
    required bool isLoading,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      IntrinsicWidth(
          child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: 25.h,
              padding: EdgeInsets.symmetric(horizontal: _counter > 0 ? 6.w : 0),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
                  ]),
              margin: EdgeInsets.only(bottom: 6.h),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                if (_counter > 0)
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: Icon(Icons.remove,
                          color: AppColors.primary, size: 15.sp),
                      onPressed: isLoading ? null : onDecrement),
                if (_counter > 0)
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child:
                          CustomText('$_counter', style: Styles.textStyle16_400)),
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon:
                        Icon(Icons.add, color: AppColors.primary, size: 15.sp),
                    onPressed: isLoading ? null : onIncrement)
              ]))),
      Gap(12.w)
    ]);
  }
}
