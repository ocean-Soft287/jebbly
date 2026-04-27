import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class StoreNoteSection extends StatefulWidget {
  final String initialNote;
  final ValueChanged<String> onChanged;

  const StoreNoteSection({
    super.key,
    required this.initialNote,
    required this.onChanged,
  });

  @override
  State<StoreNoteSection> createState() => _StoreNoteSectionState();
}

class _StoreNoteSectionState extends State<StoreNoteSection> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialNote);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // رأس القسم: ملاحظة للمتجر
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6FA),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.edit_note,
                  color: AppColors.ketchup1,
                  size: 22.sp,
                ),
                SizedBox(width: 6.w),
                Text(
                  AppLocalizations.of(context)!.store_note,
                  style: AppTextTheme.body1.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: TextField(
              controller: _controller,
              onChanged: widget.onChanged,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.note_hint,
                hintStyle: AppTextTheme.body1
                    .copyWith(color: Colors.grey.shade500, fontSize: 14.sp),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
