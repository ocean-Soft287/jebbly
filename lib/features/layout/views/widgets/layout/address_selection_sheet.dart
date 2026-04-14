import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jeebly_mobile/core/bloc/base_bloc.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/routing/routes_names.dart';
import 'package:jeebly_mobile/features/drawer/addresses/bloc/addresses_bloc.dart';
import 'package:jeebly_mobile/features/drawer/addresses/bloc/addresses_event.dart';
import 'package:jeebly_mobile/features/drawer/addresses/data/model/address_model.dart';
import 'package:jeebly_mobile/l10n/app_localizations.dart';

class AddressSelectionSheet extends StatefulWidget {
  const AddressSelectionSheet({super.key});

  @override
  State<AddressSelectionSheet> createState() => _AddressSelectionSheetState();
}

class _AddressSelectionSheetState extends State<AddressSelectionSheet> {
  @override
  void initState() {
    super.initState();
    context.read<AddressesBloc>().add(GetAddressesEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
      ),
      padding: EdgeInsets.only(
        top: 20.h,
        left: 20.w,
        right: 20.w,
        bottom: MediaQuery.of(context).padding.bottom + 20.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.grey2.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          Gap(20.h),
          Text(
            AppLocalizations.of(context)!.my_addresses,
            style: Styles.textStyle16_600,
          ),
          Gap(15.h),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 400.h),
            child: BlocBuilder<AddressesBloc, BaseState<AddressModel>>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state.isFailure) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(state.errorMessage ?? 'Error', style: Styles.textStyle14_400),
                    ),
                  );
                }
                if (state.items.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Icon(Icons.location_off_outlined, size: 48.r, color: AppColors.grey2),
                          Gap(10.h),
                          Text("No addresses found", style: Styles.textStyle14_400),
                        ],
                      ),
                    ),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.items.length,
                  separatorBuilder: (context, index) => Divider(height: 1.h, color: AppColors.grey2.withValues(alpha: 0.1)),
                  itemBuilder: (context, index) {
                    final address = state.items[index];
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 4.h),
                      leading: Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.location_on, color: AppColors.primary, size: 20.r),
                      ),
                      title: Text(address.title ?? '', style: Styles.textStyle15_600),
                      subtitle: Text(address.details ?? '', style: Styles.textStyle12_400),
                      onTap: () {
                        context.read<AddressesBloc>().add(SelectAddressEvent(address));
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
            ),
          ),
          Gap(20.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                GoRouter.of(context).push(RoutesNames.addEditAddress);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                padding: EdgeInsets.symmetric(vertical: 14.h),
                elevation: 0,
              ),
              child: Text(
                AppLocalizations.of(context)!.add_new_address,
                style: Styles.textStyle15_600.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
