import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mallturkeya/resp/colors/colors.dart';

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Container(
          width: 200,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff02B9A7),
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/images/bags.PNG",
                width: 120,
                height: 150,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  const Text(
                    "DARK BLUE COLOR \nFOLDABLE BEACH \nBAG",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff0BC7B5)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "SHOP NOW",
                      style: TextStyle(
                          color:  Color(0xff0BC7B5),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
