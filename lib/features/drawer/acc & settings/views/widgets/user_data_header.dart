import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jeebly_mobile/core/helpers/functions/custom_logger.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_cubit.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/cubit/account_state.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/account_info_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserDataHeader extends StatelessWidget {
  const UserDataHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Stack(children: [
      Column(children: [
        Gap(50.h),
        Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.r)),
            padding: EdgeInsets.only(
                top: 78.h, bottom: 30.h, left: 22.5.w, right: 22.5.w),
            width: double.infinity,
            child: Column(children: [
              const AccountInfoForm(),
              Gap(22.h),
              TextButton(
                  onPressed: () {
                    var cubit = AccountCubit.get(context);
                    cubit.validateToSaveChanges();},
                  child: Text(AppLocalizations.of(context)!.save_changes,
                      style:
                          Styles.textStyle24_500.copyWith(color: AppColors.grey2)))
            ]))
      ]),

      //======= User Image =======//
      Positioned(
          top: 0,
          left: isArabic ? null : 46.w,
          right: isArabic ? 46.w : null,
          child: BlocBuilder<AccountCubit, AccountState>(builder: (_, state) {
            var cubit = AccountCubit.get(context);
            return InkWell(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage(
                      source: ImageSource.camera, imageQuality: 80);
                  if (image != null) {
                    CustomLogger.logger.w(
                        'Image path: ${image.path} -- MimeType ${image.mimeType}');
                    if (context.mounted) {
                      cubit.changeUserImage(ClipRRect(
                          borderRadius: BorderRadius.circular(999999999999999),
                          child: Image.file(File(image.path),
                              fit: BoxFit.contain,
                              width: 100.sp,
                              height: 100.sp)));
                    }
                  }
                },
                child: Stack(children: [
                  cubit.userImage,
                  Positioned(
                      bottom: 0,
                      left: isArabic ? 8.w : null,
                      right: isArabic ? null : 8.w,
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.primary),
                          width: 24.sp,
                          height: 24.sp,
                          padding: EdgeInsets.all(6.sp),
                          child: Icon(Icons.camera_alt_outlined,
                              color: AppColors.white, size: 12.sp)))
                ]));
          }))
    ]);
  }
}