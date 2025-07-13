import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/services/ad_card.dart';

class AdsSlider extends StatefulWidget {
  const AdsSlider({super.key});

  @override
  State<AdsSlider> createState() => _AdsSliderState();
}

class _AdsSliderState extends State<AdsSlider> {
  List<AdCard> ads = [
    AdCard(url: 'https://images.ctfassets.net/j8tkpy1gjhi5/5OvVmigx6VIUsyoKz1EHUs/b8173b7dcfbd6da341ce11bcebfa86ea/Salami-pizza-hero.jpg'),
    AdCard(url: 'https://vikalinka.com/wp-content/uploads/2023/01/Tomato-Cream-Cheese-Pasta-8-Edit.jpg'),
    AdCard(url: 'https://www.mealgarden.com/media/recipe/2022/07/bigstock-Arabic-Cuisine-Kushari-Of-Ric-119321594.jpeg'),
    AdCard(url: 'https://assets.bonappetit.com/photos/58a4e12a9fda6d7fbc740e91/1:1/w_3333,h_3333,c_limit/shrimp-scampi.jpg'),
    AdCard(url: 'https://f.nooncdn.com/food_production/food/restaurant/partner_186388/6lrqzy9c_0_30Jul2024140125.jpeg?width=720&crop=720:328&format=jpg')
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
          options: CarouselOptions(
              height: 173,
              autoPlay: true,
              viewportFraction: .95,
              // enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: ads),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ads.asMap().entries.map((entry) {
            return GestureDetector(
                onTap: () => setState(() {
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
  }
}
