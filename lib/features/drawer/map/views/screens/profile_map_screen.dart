import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/features/drawer/map/cubit/profile_map_cubit.dart';
import 'package:jeebly_mobile/features/drawer/map/cubit/profile_map_state.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/map/continue_widget.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/map/map_app_bar.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/map/map_widget.dart';

class ProfileMapScreen extends StatelessWidget {
  const ProfileMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileMapCubit, ProfileMapState>(builder: (_, state) {
      var cubit = ProfileMapCubit.get(context);
      return Scaffold(
          appBar: MapAppBar(cubit: cubit),
          body: Column(children: [
            Expanded(child: MapWidget(cubit: cubit)),
            ContinueWidget(cubit: cubit, location: RoutesNames.addEditAddress)
          ]));
    });
  }
}