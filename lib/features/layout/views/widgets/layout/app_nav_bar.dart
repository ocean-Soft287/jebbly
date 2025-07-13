import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/features/layout/cubit/layout/layout_cubit.dart';
import 'package:jeebly_mobile/features/layout/cubit/layout/layout_state.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(builder: (_, state) {
      var cubit = LayoutCubit.get(context);
      return BottomNavigationBar(
          selectedLabelStyle: Styles.textStyle14_300,
          unselectedLabelStyle: Styles.textStyle14_300,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.black0,
          type: BottomNavigationBarType.fixed,
          currentIndex: cubit.selectedIndex,
          onTap: (index) => cubit.selectItem(index),
          items: cubit.items(context));
    });
  }
}