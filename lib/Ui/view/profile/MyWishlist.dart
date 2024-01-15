import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mallturkeya/Ui/view/profile/profile_view.dart';

import '../../../resp/colors/colors.dart';
import '../../../resp/images/myimages.dart';
import '../../../resp/widget/ButtonWidget.dart';
import '../../../resp/widget/TextWidget.dart';
import '../../../resp/widget/country-codes.dart';
import '../../../resp/widget/custom_text.dart';

class MyWishlist extends StatefulWidget {
  const MyWishlist({Key? key}) : super(key: key);

  @override
  State<MyWishlist> createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  Map<String, String>? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backGroundColor,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.backGroundColor,
        toolbarHeight: 32.h,
        actions: [
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Map<String, String>>(
                isExpanded: true,
                style: TextStyle(fontSize: 17, color: Colors.black),
                hint: CustomText(value: 'Urdu'.tr, color: Colors.grey[700]),
                icon: Row(
                  children: [
                    if (selectedCountry != null)
                      Image.asset(
                        'assets/icons/countries/${selectedCountry!['code']!.toLowerCase()}.png',
                        width: 24,
                        height: 24,
                      ),
                    SizedBox(width: 8),
                    SvgPicture.asset("assets/icons/polygon.svg"),
                    SizedBox(width: 8.w),
                  ],
                ),
                value: selectedCountry,
                items: codes.map<DropdownMenuItem<Map<String, String>>>((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Row(
                      children: [
                        SizedBox(width: 8.w),
                        Text(item['name'] ?? '',
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    selectedCountry = val;
                  });
                },
              ),
            ),
          ),
        ],
        bottom: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 56.h,
          backgroundColor: Colors.white,
          elevation: 2,
          title: SvgPicture.asset(
            MyImg.logo,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(MyImg.Searchicon),
            ),
            Badge(
              label: Text('2'),
              backgroundColor: Colors.red,
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(MyImg.carticon),
              ),
            ),
            SizedBox(width: 10.w),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          children: [
            Container(
              width: 414,
              height: 57.28,
              decoration: BoxDecoration(color: MyColors.greyligth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>ProfileView());
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(MyImg.arrowBack),
                        TextStyleWidget(title: 'Back', size: 16,color: MyColors.black,weight: FontWeight.w500,)
                      ],
                    ),
                  ),
                  TextStyleWidget(title: 'WISHLIST', size: 19,color: MyColors.black,weight: FontWeight.w500,),
                  SizedBox(width: 50.w,)
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: MyColors.whiteColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        shadows: [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 25,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 91.28.w,
                            height: 99.68.h,
                            child: ClipRRect(
                              child: Image(image: AssetImage(MyImg.image54)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(width: 10.w,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextStyleWidget(title: 'Trendy Sunglasses', size: 18,color: MyColors.black,weight: FontWeight.w500,),
                              Row(
                                children: [
                                  TextStyleWidget(title: 'InStock', size: 13,color: MyColors.grey10,weight: FontWeight.w500,),
                                  TextStyleWidget(title: '3', size: 15,color: MyColors.black,weight: FontWeight.w500,),
                                ],
                              ),
                              TextStyleWidget(title: '\$456', size: 15,color: MyColors.selectColors,weight: FontWeight.w500,),
                              TextStyleWidget(title: '\$678', size: 13,color: MyColors.grey10,weight: FontWeight.w500,),
                            ],
                          ),
                          SizedBox(width: 10.w,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(MyImg.cancel),
                              SizedBox(height: 60.h,),
                              SvgPicture.asset(MyImg.carticon),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
            ),
            SizedBox(height: 20.h,),
            ButtonWidget(
                onPress: (){},
                title: 'VIEW MORE', buttonColor: MyColors.selectColors, textColor: MyColors.whiteColor, buttonBorderColor: MyColors.selectColors)
          ],
        ),
      ),
    );
  }
}
