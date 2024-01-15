import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mallturkeya/Ui/view/profile/OrderScreen.dart';
import 'package:mallturkeya/resp/colors/colors.dart';
import 'package:mallturkeya/resp/images/myimages.dart';
import 'package:mallturkeya/resp/widget/ButtonWidget.dart';
import 'package:mallturkeya/resp/widget/TextWidget.dart';

class ThanksScreen extends StatefulWidget {
  const ThanksScreen({Key? key}) : super(key: key);

  @override
  State<ThanksScreen> createState() => _ThanksScreenState();
}

class _ThanksScreenState extends State<ThanksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(MyImg.bags),
              SizedBox(
                height: 50.h,
              ),
              TextStyleWidget(
                title: 'Thank You!',
                size: 34,
                color: MyColors.black,
                weight: FontWeight.w700,
              ),
              SizedBox(
                height: 10,
              ),
              TextStyleWidget(
                title:
                    'Your order will be delivered soon.\nWe will get back to you soon!\nYour Order no : ${8363454}',
                size: 14,
                weight: FontWeight.w400,
                color: MyColors.black,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              ButtonWidget(
                  title: 'VIEW ORDER',
                  buttonColor: MyColors.whiteColor,
                  textColor: MyColors.selectColors,
                  buttonBorderColor: MyColors.selectColors,
                  onPress: () {
                    Get.to(OrdersScreen());
                  }),
              SizedBox(
                height: 20,
              ),
              ButtonWidget(
                  title: 'CONTINUE SHOPPING',
                  buttonColor: MyColors.selectColors,
                  textColor: MyColors.whiteColor,
                  buttonBorderColor: MyColors.selectColors,
                  onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
