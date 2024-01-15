import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';
import 'ButtonWidget.dart';

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: MyColors.whiteColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: MyColors.greencolors,
            ),
            child: Image.asset("assets/images/dones.png"),
          ),
          SizedBox(height: 20.h),
          const Text(
            "Successful",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: MyColors.black,
            ),
          ),
          Text(
            "Your Item is Successfully Added in ",
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: const Color(0xff4F4F4F),
            ),
          ),
          Text(
            "  your Card ",
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: const Color(0xff4F4F4F),
            ),
          ),
          SizedBox(height: 20.h),
          ButtonWidget(
            onPress: () {},
            title: "Continue Shop",
            buttonColor: MyColors.recolor,
            textColor: MyColors.whiteColor,
            buttonBorderColor: Colors.transparent,
          ),
          SizedBox(height: 10.h),
          ButtonWidget(
            onPress: () {},
            title: "Continue Shop",
            buttonColor: Colors.transparent,
            textColor: MyColors.recolor,
            buttonBorderColor: MyColors.recolor,
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
