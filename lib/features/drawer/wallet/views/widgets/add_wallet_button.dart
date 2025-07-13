import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/di/setup_get.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/features/drawer/wallet/cubit/wallet_cubit.dart';
import 'package:jeebly_mobile/features/drawer/wallet/views/widgets/wallets_bottom_sheet.dart';

class AddWalletButton extends StatelessWidget {
  const AddWalletButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 29.h),
        child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (_) => BlocProvider(
                      create: (_) => getIt.get<WalletCubit>(),
                      child: WalletsBottomSheet()),
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(48.r))));
            },
            backgroundColor: AppColors.primary,
            child: Icon(Icons.add, size: 30.sp)));
  }
}