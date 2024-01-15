import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Banner2Widget extends StatelessWidget {
  const Banner2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 225,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Container(
          width: 200,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff02B9A7),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "MORE DEALS \n",
                      ),
                      TextSpan(
                        text: "INSIDE",
                        style: TextStyle(color: Colors.red),
                      ),
                      TextSpan(
                        text: " UP TO\n50% OFF",
                      ),
                    ],
                  ),
                ),
                
                SizedBox(width: 7.w),
                Image.asset(
                  "assets/images/covers.png",
                  width: 150,
                  height: 150,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
