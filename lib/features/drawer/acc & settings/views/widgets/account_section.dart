import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:jeebly_mobile/core/theme/styles.dart';
import 'package:jeebly_mobile/features/drawer/acc%20&%20settings/views/widgets/section_item.dart';

class AccountSection extends StatelessWidget {
  const AccountSection(
      {super.key, required this.title, required this.sectionItems});
  final String title;
  final List<SectionItem> sectionItems;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: Styles.textStyle16_300),
      Gap(10.h),
      for (int i = 0; i < sectionItems.length; i++) ...[
        sectionItems[i],
        if (i < sectionItems.length - 1) Gap(9.h)
      ]
    ]);
  }
}