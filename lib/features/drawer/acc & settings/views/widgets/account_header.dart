import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_cubit.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_state.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/user_image.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(28.r),
                bottomLeft: Radius.circular(28.r))),
        child: SafeArea(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: BlocBuilder<AccountCubit, AccountState>(
                      builder: (context, state) {
                        final cubit = AccountCubit.get(context);
                        return Column(children: [
                          const UserImage(),
                          Gap(10.h),
                          Text(cubit.accountModel?.fullName ?? '...',
                              style: Styles.textStyle20),
                          Text(cubit.accountModel?.phoneNumber ?? '...',
                              style: Styles.textStyle11_300),
                        ]);
                      },
                    )),
                Icon(CupertinoIcons.square_grid_2x2, color: AppColors.black2)
              ]),
        ));
  }
}