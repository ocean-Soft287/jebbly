import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/features/layout/cubit/map/map_cubit.dart';
import 'package:jeebly_mobile/features/layout/cubit/map/map_state.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/map/continue_widget.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/map/map_app_bar.dart';
import 'package:jeebly_mobile/features/layout/views/widgets/map/map_widget.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(builder: (_, state) {
      var cubit = MapCubit.get(context);
      return Scaffold(
          appBar: MapAppBar(cubit: cubit),
          body: Column(children: [
            Expanded(child: MapWidget(cubit: cubit)),
            ContinueWidget(cubit: cubit)
          ]));
    });
  }
}