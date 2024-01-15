import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'TextWidget.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final buttonColor;
  final buttonBorderColor;
  final textColor;

  ButtonWidget({Key? key, required this.title,required this.buttonColor,required this.textColor,required this.buttonBorderColor, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 388.w,
        height: 50.h,
        decoration: ShapeDecoration(
          color: buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                  color: buttonBorderColor
              )
          ),
        ),
        child: Center(
          child: TextStyleWidget(title: title, size: 16, color: textColor,),
        ),
      ),
    );
  }
}
