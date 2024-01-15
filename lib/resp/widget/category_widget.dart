import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../colors/colors.dart';
class CategoryWidget extends StatelessWidget {
  final String img;
  final String title;

  const CategoryWidget({Key? key, required this.img, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2,right: 5),
      child: Container(
        width: 150,
        height: 160,
        color: MyColors.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(img),
            SizedBox(height: 13.h),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
