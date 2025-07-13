import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/password.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/user_data_header.dart';

class AccountDataScreen extends StatelessWidget {
  const AccountDataScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              children: [const UserDataHeader(), Gap(25.h), const Password()]),
        )
      ));
}