import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/core/http/endpoints.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/features/home/bloc/ads_bloc.dart';
import 'package:jeebly_mobile/features/home/data/models/ad_model.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/services/ad_card.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../home/bloc/ads_event.dart';

class AdsSlider extends StatefulWidget {
  const AdsSlider({super.key});

  @override
  State<AdsSlider> createState() => _AdsSliderState();
}

class _AdsSliderState extends State<AdsSlider> {

  int _current = 0;

  @override
  void initState() {
    super.initState();
    context.read<AdsBloc>().add(const GetAdsEvent());
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsBloc, BaseState<AdModel>>(
      builder: (context, state) {
        if (state.status == Status.loading) {
          return _buildShimmer();
        } else if (state.status == Status.success && state.items.isNotEmpty) {
          return Column(children: [
            CarouselSlider(
                options: CarouselOptions(
                    height: 173.h,
                    autoPlay: true,
                    viewportFraction: .95,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: state.items.map((ad) {
                  return AdCard(url: '${Endpoints.baseUrl}${ad.coverUrl}');
                }).toList()),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: state.items
                    .asMap()
                    .entries
                    .map((entry) {
                  return GestureDetector(
                      onTap: () =>
                          setState(() {
                            _current = entry.key;
                          }),
                      child: Container(
                          width: 4.sp,
                          height: 4.sp,
                          margin: EdgeInsets.symmetric(horizontal: 6.w),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == entry.key
                                  ? AppColors.primary
                                  : AppColors.ketchup0)));
                }).toList())
          ]);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 173.h,
        margin: EdgeInsets.symmetric(horizontal: 17.w, vertical: 19.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
