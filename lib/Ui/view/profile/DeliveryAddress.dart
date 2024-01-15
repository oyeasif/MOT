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


class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({Key? key}) : super(key: key);

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
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
                style: const TextStyle(fontSize: 17, color: Colors.black),
                hint: CustomText(value: 'Urdu'.tr, color: Colors.grey[700]),
                icon: Row(
                  children: [
                    if (selectedCountry != null)
                      Image.asset(
                        'assets/icons/countries/${selectedCountry!['code']!.toLowerCase()}.png',
                        width: 24,
                        height: 24,
                      ),
                    const SizedBox(width: 8),
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
                            style: const TextStyle(fontSize: 20)),
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
              label: const Text('2'),
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
              decoration: const BoxDecoration(color: MyColors.greyligth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const ProfileView());
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(MyImg.arrowBack),
                        TextStyleWidget(title: 'Back', size: 16,color: MyColors.black,weight: FontWeight.w500,)
                      ],
                    ),
                  ),
                  TextStyleWidget(title: 'ADDRESS', size: 19,color: MyColors.black,weight: FontWeight.w500,),
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
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: MyColors.whiteColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 25,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(value: 0, groupValue: 1, onChanged: (value){}),
                              TextStyleWidget(title: 'Jane Doe', size: 15,weight: FontWeight.w500,color: MyColors.black,),
                              Container(
                                width: 61.76,
                                height: 20.53,
                                decoration: ShapeDecoration(
                                  color: MyColors.redlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(111),
                                  ),
                                ),
                                child: Center(
                                  child: TextStyleWidget(title: 'Home', size: 12,color: MyColors.selectColors,weight: FontWeight.w700,),
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Icon(Icons.edit),
                              Icon(Icons.delete,color: MyColors.selectColors,)
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: TextStyleWidget(title: '3 Newbridge Court', size: 14,color: MyColors.black,weight: FontWeight.w400,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: TextStyleWidget(title: 'Chino Hills, CA 91709, United States', size: 14,color: MyColors.black,weight: FontWeight.w400,),
                      ),
                    ],
                  ),
                ),
              );
            }
            ),
            SizedBox(height: 20.h,),
            ButtonWidget(
                onPress: (){},
                title: 'ADD ADDRESS', buttonColor: MyColors.selectColors, textColor: MyColors.whiteColor, buttonBorderColor: MyColors.selectColors)
          ],
        ),
      ),
    );
  }
}
