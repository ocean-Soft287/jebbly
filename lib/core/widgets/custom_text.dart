import 'package:flutter/material.dart';
import 'package:jeebly_mobile/core/helpers/functions/number_translation.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText(this.text,
      {super.key, this.style, this.textAlign, this.maxLines, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(text.numTr(context),
        style: style,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow);
  }
}