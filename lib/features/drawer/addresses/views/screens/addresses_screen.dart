import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/features/drawer/addresses/views/widgets/address_card.dart';
import 'package:jeebly_mobile/features/drawer/addresses/views/widgets/addresses_app_bar.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AddressesAppBar(),
    body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
        itemBuilder: (_, index) => const AddressCard(),
        separatorBuilder: (_, index) => Gap(12.h),
        itemCount: 60)
    );
  }
}