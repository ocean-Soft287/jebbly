import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/app_colors.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/core/widgets/custom_text.dart';

class CounterBox extends StatefulWidget {
  const CounterBox({super.key, this.initialCount});
  final int? initialCount;

  @override
  State<CounterBox> createState() => _CounterBoxState();
}

class _CounterBoxState extends State<CounterBox> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialCount ?? 0;
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      IntrinsicWidth(
          child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: 25.h,
              padding: EdgeInsets.symmetric(horizontal: _counter > 0 ? 6.w : 0),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
                  ]),
              margin: EdgeInsets.only(bottom: 6.h),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                if (_counter > 0)
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: Icon(Icons.remove,
                          color: AppColors.primary, size: 15.sp),
                      onPressed: _decrement),
                if (_counter > 0)
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: CustomText('$_counter', style: Styles.textStyle16_400)),
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon:
                        Icon(Icons.add, color: AppColors.primary, size: 15.sp),
                    onPressed: _increment)
              ]))),
      Gap(12.w)
    ]);
  }
}