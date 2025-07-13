import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_divider.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/layout/layout_drawer.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/services/ads_slider.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/services/new_restaurants.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/services/provided_services.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/services/select_service_app_bar.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/services/services_search.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/services/welcome_text.dart';

class SelectServiceScreen extends StatelessWidget {
  const SelectServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: const SelectServiceAppBar(),
        drawer: LayoutDrawer(),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CustomDivider(),
              const ServicesSearch(),
              const CustomDivider(),
              const AdsSlider(),
              const WelcomeText(),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(children: [const ProvidedServices(),
                    Gap(44.h),
                    const NewRestaurants(),
                    Gap(12.h),
                    const NewRestaurants()
                  ])),
              Gap(26.h)
            ])));
  }
}