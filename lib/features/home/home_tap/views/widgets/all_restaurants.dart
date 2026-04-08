import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/core/bloc/paginated_bloc/paginated_bloc.dart';
import 'package:jeebly_mobile/core/service_locator/setup_get.dart';
import 'package:jeebly_mobile/features/home/restaurants/cubit/restaurant_bloc.dart';
import 'package:jeebly_mobile/features/home/restaurants/data/models/restaurant_model.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/helpers/app_assets.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_svg.dart';
import 'package:jeebly_mobile/core/widgets/item_single_image.dart';

class AllRestaurants extends StatefulWidget {
  const AllRestaurants({super.key});

  @override
  State<AllRestaurants> createState() => _AllRestaurantsState();
}

class _AllRestaurantsState extends State<AllRestaurants> {
  late final RestaurantBloc _bloc;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _bloc = getIt<RestaurantBloc>();
    _bloc.add(const LoadFirstPage<RestaurantModel>());
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.9) {
      _bloc.add(const LoadNextPage<RestaurantModel>());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocProvider.value(
      value: _bloc,
      child: Column(
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
                itemCount: state.items.length + (state.hasReachedMax ? 0 : 1),
                itemBuilder: (context, index) {
                  if (index >= state.items.length) {
                    if (state.status == Status.failure) {
                      return Center(child: Text(state.errorMessage ?? 'Error'));
                    }
                    return const Center(child: CircularProgressIndicator());
                  }

                  final item = state.items[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: ItemSingleImage(
                        type: 'restaurant',
                        imageUrl: item.logo != "" ? 'https://jeebly.runasp.net${item.logo}' : '',
                        imageWidth: width - 20.w,
                        imageHeight: 120.h,
                        withFavIcon: true,
                        available: item.status == 'Active',
                        centered: true,
                        title: Localizations.localeOf(context).languageCode == 'ar'
                            ? (item.nameOfResturantAr != "" ? item.nameOfResturantAr : item.nameOfResturantOwner)
                            : (item.nameOfResturantEn != "" ? item.nameOfResturantEn : item.nameOfResturantOwner),
                        distance: '1.3', // Static for now as not in response
                        subtitle: Localizations.localeOf(context).languageCode == 'ar'
                            ? (item.descriptionAr != "" ? item.descriptionAr : item.areaOfResturantAr)
                            : (item.descriptionEn != "" ? item.descriptionEn : item.areaOfResturantEn),
                        deliveryPrice: '7.5', // Static for now as not in response
                        totalRating: item.rate.toString(),
                        rateCount: '614' // Static for now as not in response
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
