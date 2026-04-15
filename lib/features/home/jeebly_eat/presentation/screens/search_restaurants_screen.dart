import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:jeebly_mobile/core/widgets/custom_text_field.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';
import '../../../../../core/bloc/base_bloc.dart';
import '../../manager/search_restaurant_bloc/search_restaurant_bloc.dart';
import '../../manager/search_restaurant_bloc/search_restaurant_event.dart';
import '../../model/search_restaurant_model.dart';
import '../widgets/search_restaurant_item.dart';

class SearchRestaurantsScreen extends StatefulWidget {
  const SearchRestaurantsScreen({super.key});

  @override
  State<SearchRestaurantsScreen> createState() => _SearchRestaurantsScreenState();
}

class _SearchRestaurantsScreenState extends State<SearchRestaurantsScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final searchKey = _searchController.text.trim();
      if (searchKey.isEmpty) {
        context.read<SearchRestaurantBloc>().add(ClearSearch());
      } else {
        context.read<SearchRestaurantBloc>().add(PerformSearch(searchKey));
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Following user's example logic for dark mode
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.black0 : AppColors.white,
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.search,
        backgroundColor: isDarkMode ? AppColors.black0 : AppColors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                controller: _searchController,
                hintText: AppLocalizations.of(context)!.looking_for_a_specific_product,
                suffixIcon: const Icon(Icons.search),
                suffixIconColor: isDarkMode ? Colors.white70 : AppColors.primary,
                borderColor: isDarkMode ? Colors.white10 : AppColors.grey0,
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<SearchRestaurantBloc, BaseState<SearchRestaurantModel>>(
              builder: (context, state) {
                if (state.status == Status.loading) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  );
                } else if (state.status == Status.success && state.items.isNotEmpty) {
                  final restaurants = state.items;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(10.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.89,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                    ),
                    itemCount: restaurants.length,
                    itemBuilder: (context, index) {
                      return SearchRestaurantItem(
                        restaurant: restaurants[index],
                      );
                    },
                  );
                } else if (state.status == Status.success && _searchController.text.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 80,
                          color: isDarkMode ? Colors.white12 : Colors.grey.shade300,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          AppLocalizations.of(context)!.no_results_found,
                          style: Styles.textStyle16_500.copyWith(
                            color: isDarkMode ? Colors.white38 : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
