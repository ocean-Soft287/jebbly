import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/service_locator/setup_get.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/widgets/custom_app_bar.dart';
import 'package:jeebly_mobile/features/drawer/addresses/bloc/addresses_bloc.dart';
import 'package:jeebly_mobile/features/drawer/addresses/cubit/address_cubit.dart';
import 'package:jeebly_mobile/features/drawer/addresses/views/widgets/address_info_form.dart';
import 'package:jeebly_mobile/features/drawer/addresses/views/widgets/confirm_address_button.dart';
import 'package:jeebly_mobile/features/drawer/addresses/views/widgets/ddress_details_header.dart';

import '../../data/model/address_model.dart';

class AddEditAddressScreen extends StatelessWidget {
  const AddEditAddressScreen({super.key, this.address});
  final AddressModel? address;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // AddressCubit — owns form key + controllers
        BlocProvider(create: (_) => AddressCubit(address: address)),
        // AddressesBloc — handles API calls
        BlocProvider(create: (_) => getIt<AddressesBloc>()),
      ],
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: const CustomAppBar(),
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const AddressDetailsHeader(),
                    AddressInfoForm(address: address),
                    const ConfirmAddressButton(),
                  ]))),
    );
  }
}