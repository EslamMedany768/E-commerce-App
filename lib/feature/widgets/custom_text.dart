


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Core/utils/app_colors.dart';

class CustomText extends StatelessWidget {
  String text;
  TextStyle? style;
  Color? color;
  FontWeight? fontWeight;
  double? fontSize;

  CustomText({
    super.key,
    required this.text,
    this.style,
    this.fontWeight,
    this.color,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style:
          style ??
          Theme.of(context).textTheme.titleMedium!.copyWith(
            color: color ?? AppColor.primary,
            fontWeight: fontWeight ?? FontWeight.bold,
            fontSize: fontSize ?? 14,
          ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
