import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../core/bloc/base_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../manager/general_cart_bloc/general_cart_bloc.dart';
import '../../manager/general_cart_bloc/general_cart_event.dart';
import '../../models/general_cart_model.dart';
import '../widgets/cart_empty_view.dart';
import '../widgets/restaurant_cart.dart';
import '../widgets/top_bar_widget.dart';

class GeneralCartScreen extends StatefulWidget {
  const GeneralCartScreen({super.key});

  @override
  State<GeneralCartScreen> createState() => _GeneralCartScreenState();
}

class _GeneralCartScreenState extends State<GeneralCartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GeneralCartBloc>().add(const FetchGeneralCart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CartTopBar(),
            Expanded(
              child: BlocBuilder<GeneralCartBloc, BaseState<GeneralCartModel>>(
                builder: (context, state) {
                  if (state.status == Status.loading && state.items.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  if (state.status == Status.failure && state.items.isEmpty) {
                    return _ErrorView(
                      message: state.errorMessage?? "",
                      onRetry: () => context
                          .read<GeneralCartBloc>()
                          .add(const FetchGeneralCart()),
                    );
                  }

                  if (state.items.isEmpty) {
                    return const CartEmptyView();
                  }

                  return RefreshIndicator(
                    color: AppColors.primary,
                    onRefresh: () async {
                      context
                          .read<GeneralCartBloc>()
                          .add(const RefreshGeneralCart());
                      // ننتظر حتى تكتمل أول حالة نجاح/فشل بعد الريفرش
                      await context
                          .read<GeneralCartBloc>()
                          .stream
                          .firstWhere((s) =>
                      s.status == Status.success ||
                          s.status == Status.failure);
                    },
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      itemCount: state.items.length,
                      separatorBuilder: (_, __) => SizedBox(height: 20.h),
                      itemBuilder: (_, index) {
                        final restaurant = state.items[index];
                        return CartRestaurantCard(restaurant: restaurant);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 56.sp, color: Colors.redAccent),
            SizedBox(height: 12.h),
            Text(
              message.isEmpty ? 'common.error' : message,
              textAlign: TextAlign.center,
              style: AppTextTheme.body1,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              child: Text('common.retry'),
            ),
          ],
        ),
      ),
    );
  }
}