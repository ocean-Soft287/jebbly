import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/counter_box.dart';
import 'package:jeebly_mobile/core/widgets/custom_network_image.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';
import 'package:jeebly_mobile/features/home/restaurants/models/product_model.dart';
import '../../../../cart/manager/cart_cubit.dart';
import '../../../../../core/http/endpoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantProduct extends StatelessWidget {
  final ProductModel product;
  const RestaurantProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push(RoutesNames.productDetails, extra: product),
      child: Padding(
          padding: EdgeInsets.all(10.sp),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                CustomText(product.nameAr, style: Styles.textStyle16_600, maxLines: 1, overflow: TextOverflow.ellipsis),
                Gap(4.h),
                CustomText(product.descriptionAr, style: Styles.textStyle12_400.copyWith(color: Colors.grey), maxLines: 2, overflow: TextOverflow.ellipsis),
                Gap(8.h),
                CustomText('${product.price} د.ل', style: Styles.textStyle16_600.copyWith(color: AppColors.primary)),
              ]),
            ),
            Gap(12.w),
            Stack(children: [
              Column(children: [
                Gap(6.h),
                CustomNetworkImage(
                    url: '${Endpoints.baseUrl}${product.imageUrl}',
                    width: 100.w,
                    height: 90.h,
                    fit: BoxFit.cover,
                )
              ]),
              Positioned(
                bottom: 0,
                right: 0,
                child: CounterBox(
                  onIncrement: () {
                    context.read<CartCubit>().addToCart(
                          productId: product.id,
                          quantity: 1,
                        );
                  },
                ),
              )
            ])
          ])),
    );
  }
}