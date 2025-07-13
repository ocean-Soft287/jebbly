import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/features/layout/cubit/layout/layout_cubit.dart';
import 'package:jeebly_mobile/features/layout/cubit/layout/layout_state.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/layout/app_nav_bar.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/layout/layout_app_bar.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/layout/layout_drawer.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LayoutDrawer(),
        appBar: LayoutAppBar(),
        body: BlocBuilder<LayoutCubit, LayoutState>(builder: (_, state) {
          var cubit = LayoutCubit.get(context);
          return cubit.screens[cubit.selectedIndex];
        }),
        bottomNavigationBar: AppNavBar());
  }
}