import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mallturkeya/resp/colors/colors.dart';
import 'package:mallturkeya/resp/images/myimages.dart';
import 'package:mallturkeya/Ui/view/profile/AboutUs.dart';
import 'package:mallturkeya/Ui/view/profile/DeliveryAddress.dart';
import 'package:mallturkeya/Ui/view/profile/MyWishlist.dart';
import 'package:mallturkeya/Ui/view/profile/OrderScreen.dart';
import 'package:mallturkeya/Ui/view/profile/SelectLanguage.dart';
import 'package:mallturkeya/Ui/view/profile/editAccount.dart';
import 'package:mallturkeya/resp/widget/AccountListTile.dart';
import 'package:mallturkeya/resp/widget/TextWidget.dart';
import 'package:mallturkeya/resp/widget/custom_text.dart';

import '../../../resp/widget/country-codes.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Map<String, String>? selectedCountry;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: MyColors.backGroundColor,
        ),
        child: ListView(
          children: [
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              width: 392,
              height: 142,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextStyleWidget(title: 'My Profile', size: 18, color: MyColors.black,weight: FontWeight.w500,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            TextStyleWidget(title: 'Matilda Brown', size: 18, color: MyColors.black,weight: FontWeight.w500,),
                            SizedBox(height: 5.h,),
                            TextStyleWidget(title: '+90 909334532', size: 15, color: MyColors.grey10,weight: FontWeight.w500,),
                        ],
                      ),
                      GestureDetector(
                          onTap: (){
                            Get.to(()=>EditAccount());
                            },
                          child: SvgPicture.asset(MyImg.editAccount))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            AccountListTile(title: 'My Wishlist', onPress: () {
              Get.to(()=>MyWishlist());
            },),
            SizedBox(
              height: 10.h,
            ),
            AccountListTile(title: 'My Order', onPress: () {
              Get.to(()=>OrdersScreen());
            },),
            SizedBox(
              height: 10.h,
            ),
            AccountListTile(title: 'Delivery Address', onPress: () {
              Get.to(()=>DeliveryAddress());
            },),
            SizedBox(
              height: 10.h,
            ),

            AccountListTile(title: 'About Us', onPress: () { Get.to(()=>AboutUs()); },),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: (){
                Get.to(Language());
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: 392,
                height: 58,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextStyleWidget(title: 'Language', size: 16, weight: FontWeight.w500,color: MyColors.black,),
                    TextStyleWidget(title: 'English', size: 16, weight: FontWeight.w500,color: MyColors.selectColors,),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            AccountListTile(title: 'Logout', onPress: () {  },),
            SizedBox(
              height: 10.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: MyColors.grey20,
              ),
              width: 392,
              height: 120,
              padding: EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextStyleWidget(title: 'Phone: ', size: 14, color: MyColors.black,weight: FontWeight.w500,),
                      TextStyleWidget(title: '+965 99732998', size: 14, color: MyColors.black,weight: FontWeight.w500,),
                    ],
                  ),
                  Row(
                    children: [
                      TextStyleWidget(title: 'Email us: ', size: 14, color: MyColors.black,weight: FontWeight.w500,),
                      TextStyleWidget(title: 'info@mallofturkeya.com', size: 14, color: MyColors.black,weight: FontWeight.w500,),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 392,
              height: 58,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.deepPurple
                  )
                ),
              ),
              child: Center(
                child: TextStyleWidget(title: 'Customer Services', size: 16, color: Colors.deepPurple,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}