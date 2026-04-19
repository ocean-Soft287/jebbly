import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/service_locator/service_locator.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/features/home/bloc/ads_bloc.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/layout/layout_drawer.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/services/ads_slider.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/services/new_restaurants_for_select_service.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/services/provided_services.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/services/select_service_app_bar.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/services/welcome_text.dart';

import '../../../home/restaurants/manager/restaurannt_bloc/restaurant_bloc.dart';

class SelectServiceScreen extends StatelessWidget {
  const SelectServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AdsBloc>()),
        BlocProvider.value(value:  getIt<RestaurantBloc>()),
      ],
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: const SelectServiceAppBar(),
          drawer: LayoutDrawer(),
          body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const ServicesSearch(),
                    // const CustomDivider(),
                    const AdsSlider(),
                    const WelcomeText(),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Column(children: [
                          const ProvidedServices(),
                          Gap(44.h),
                          const NewRestaurantsForSelectService(),
                        ])),
                    Gap(26.h)
                  ]))),
    );
  }
}