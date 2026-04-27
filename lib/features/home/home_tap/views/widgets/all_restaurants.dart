import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/core/bloc/paginated_bloc/paginated_bloc.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';
import '../../../../../core/widgets/restaurant_card.dart';
import '../../../restaurants/manager/restaurannt_bloc/restaurant_bloc.dart';
import '../../../restaurants/models/restaurant_model.dart';

class AllRestaurants extends StatefulWidget {
  const AllRestaurants({super.key});

  @override
  State<AllRestaurants> createState() => _AllRestaurantsState();
}

class _AllRestaurantsState extends State<AllRestaurants> {


  @override
  void initState() {
    super.initState();
    context.read<RestaurantBloc>().add(const LoadFirstPage<RestaurantModel>());
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(children: [
          Text(AppLocalizations.of(context)!.all_restaurants,
              style: Styles.textStyle15_600.copyWith(color: AppColors.black0)),
          const Spacer(),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey1),
                  borderRadius: BorderRadius.circular(20.r)),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              child: CustomSVG(assetName: AppAssets.filter)),
          Gap(10.w)
        ]),
        Gap(12.h),
        BlocBuilder<RestaurantBloc, BaseState<RestaurantModel>>(
          builder: (context, state) {
            if (state.status == Status.loading && state.items.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == Status.failure && state.items.isEmpty) {
              return Center(child: Text(state.errorMessage ?? 'Error'));
            }


            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: RestaurantCard(model: item, imageWidth: width - 20.w, imageHeight: 120.h),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
