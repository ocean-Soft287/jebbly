import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/features/drawer/addresses/bloc/addresses_bloc.dart';
import 'package:jeebly_mobile/features/drawer/addresses/bloc/addresses_event.dart';
import 'package:jeebly_mobile/features/drawer/addresses/views/widgets/address_card.dart';
import 'package:jeebly_mobile/features/drawer/addresses/views/widgets/addresses_app_bar.dart';
import 'package:jeebly_mobile/features/drawer/addresses/data/model/address_model.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AddressesBloc>().add(const GetAddressesEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AddressesAppBar(),
      body: BlocBuilder<AddressesBloc, BaseState<AddressModel>>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.isFailure) {
            return Center(child: Text(state.errorMessage ?? ''));
          }
          if (state.isSuccess && state.items.isEmpty) {
            return const Center(child: Icon(Icons.location_off_outlined));
          }
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding:
                EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
            itemCount: state.items.length,
            separatorBuilder: (_, __) => Gap(12.h),
            itemBuilder: (_, index) =>
                AddressCard(address: state.items[index]),
          );
        },
      ),
    );
  }
}