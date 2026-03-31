import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jeebly_mobile/core/widgets/custom_network_image.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_cubit.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_state.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(builder: (_, state) {
      var cubit = AccountCubit.get(context);
      if (cubit.accountModel?.imageUrl != null) {
        return CustomNetworkImage(
            radius: 999999999999999,
            width: 100.sp,
            height: 100.sp,
            url: cubit.accountModel!.imageUrl!);
      }
      return cubit.userImage;
    });
  }
}