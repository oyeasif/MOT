import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mallturkeya/resp/colors/colors.dart';

class SmallBannerWidget extends StatelessWidget {
  final String img;
  final String title;
  final String? img2;
  final String? title2;
  final bool condition;
  const SmallBannerWidget(
      {super.key,
      required this.img,
      required this.title,
      this.img2,
      this.title2,
      required this.condition});

  @override
  Widget build(BuildContext context) {
    return  Container(
  width: double.infinity,
  decoration: BoxDecoration(
    color: condition ? const Color.fromRGBO(111,207, 151, 0.2):const Color.fromRGBO(231,33, 40, 0.1),
  ),
  height: 59,
  child: Row(
    children: [
      SizedBox(width: 4.w),
      Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Image.asset(
          img,
          width: 28,
          height: 28,
          color: condition ? MyColors.greencolor : Colors.amber,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 13, right: 21),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: condition ? MyColors.greencolor : MyColors.orangeColor,
          ),
        ),
      ),
      if (condition)
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 20),
          child: Image.asset(
            img2!,
            color: MyColors.greencolor,
          ),
        )
      else
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 22),
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 10),
            child: Container(
              child: AnimatedTextKit(
                repeatForever: true,
                isRepeatingAnimation: true,
                animatedTexts: [
                  RotateAnimatedText(
                    "Security Privacy >",
                    rotateOut: true,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: MyColors.orangeColor,
                    ),
                  ),
                  RotateAnimatedText(
                    "Abouts Us >",
                    rotateOut: false,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: MyColors.orangeColor,
                    ),
                  ),
                  RotateAnimatedText(
                    
                    "Contact us >",
                    rotateOut: true,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: MyColors.orangeColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    ],
  ),
); }
}
