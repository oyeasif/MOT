import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget {
  final String value;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool lineThrough, overFlowVisible, underLine;
  final int? maxLines;
  const CustomText(
      {Key? key,
      required this.value,
      this.color,
      this.size,
      this.fontWeight,
      this.textAlign,
      this.lineThrough = false,
      this.overFlowVisible = false,
      this.underLine = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(value,
        maxLines: maxLines,
        style: TextStyle(
            fontSize: 18,
            color: color ?? Colors.black,
            fontWeight: fontWeight ?? FontWeight.w400,
            decoration: lineThrough
                ? TextDecoration.lineThrough
                : underLine
                    ? TextDecoration.underline
                    : null),
        textAlign: textAlign,
        overflow: overFlowVisible ? TextOverflow.visible : TextOverflow.clip);
  }
}
