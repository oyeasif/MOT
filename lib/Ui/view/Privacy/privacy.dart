import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mallturkeya/Ui/view/home/home_view.dart';
import 'package:mallturkeya/resp/widget/TextWidget.dart';

import '../../../resp/colors/colors.dart';
import '../../../resp/images/myimages.dart';
import '../../../resp/widget/country-codes.dart';
import '../../../resp/widget/custom_text.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  Map<String, String>? selectedCountry;

  bool privacyPolicy = true;
  bool terms = true;
  bool contactUs = true;
  bool aboutUs = true;
  bool helpCenter = true;

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
                items:
                codes.map<DropdownMenuItem<Map<String, String>>>((item) {
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
          title: GestureDetector(
            onTap: (){
              Get.to(HomeView());
            },
            child: Row(
              children: [
                SvgPicture.asset(MyImg.arrowBack,height: 20,),
                Text('Back'),
              ],
            ),
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
      body: ListView(
        children: [
          Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  title: TextStyleWidget(title: 'Privacy Policy', size: 16,weight: FontWeight.w500,color: MyColors.black,),
                  trailing: GestureDetector(
                      onTap: (){
                        setState(() {
                          privacyPolicy = !privacyPolicy;
                        });
                      },
                      child: SvgPicture.asset(privacyPolicy ? MyImg.arrowUp : MyImg.arrowDown)),
                ),
                SizedBox(height: 10.h,),
                if(privacyPolicy) Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleWidget(title: 'Lorem Ipsum is simply', size: 18,color: MyColors.black,weight: FontWeight.w500,),
                      SizedBox(height: 5.h,),
                      TextStyleWidget(title: 'Dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,remaining essentially unchanged. ',
                        size: 14,color: MyColors.grey50,weight: FontWeight.w400,),
                    ],
                  ),
                ),

                ListTile(
                  title: TextStyleWidget(title: 'Terms and Condition', size: 16,weight: FontWeight.w500,color: MyColors.black,),
                  trailing: GestureDetector(
                      onTap: (){
                        setState(() {
                          terms = !terms;
                        });
                      },
                      child: SvgPicture.asset(terms ? MyImg.arrowUp : MyImg.arrowDown)),
                ),
                SizedBox(height: 10.h,),
                if(terms) Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleWidget(title: 'Lorem Ipsum is simply', size: 18,color: MyColors.black,weight: FontWeight.w500,),
                      SizedBox(height: 5.h,),
                      TextStyleWidget(title: 'Dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,remaining essentially unchanged. ',
                        size: 14,color: MyColors.grey50,weight: FontWeight.w400,),
                    ],
                  ),
                ),

                ListTile(
                  title: TextStyleWidget(title: 'Contact us', size: 16,weight: FontWeight.w500,color: MyColors.black,),
                  trailing: GestureDetector(
                      onTap: (){
                        setState(() {
                          contactUs = !contactUs;
                        });
                      },
                      child: SvgPicture.asset(contactUs ? MyImg.arrowUp : MyImg.arrowDown)),
                ),
                SizedBox(height: 10.h,),
                if(contactUs) Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleWidget(title: 'Lorem Ipsum is simply', size: 18,color: MyColors.black,weight: FontWeight.w500,),
                      SizedBox(height: 5.h,),
                      TextStyleWidget(title: 'Dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,remaining essentially unchanged. ',
                        size: 14,color: MyColors.grey50,weight: FontWeight.w400,),
                    ],
                  ),
                ),

                ListTile(
                  title: TextStyleWidget(title: 'About us', size: 16,weight: FontWeight.w500,color: MyColors.black,),
                  trailing: GestureDetector(
                      onTap: (){
                        setState(() {
                          aboutUs = !aboutUs;
                        });
                      },
                      child: SvgPicture.asset(aboutUs ? MyImg.arrowUp : MyImg.arrowDown)),
                ),
                SizedBox(height: 10.h,),
                if(aboutUs) Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleWidget(title: 'Mall of Turkeya (MOT) is a marketplace that connects Buyers from all around the world with Turkish manufacturers, wholesalers, and retailers. We plan to promote Turkish products abroad to increase awareness of Turkish products and brands and help Turkish producers, suppliers, and retailers to increase their international outreach and access to foreign markets',
                        size: 14,color: MyColors.grey50,weight: FontWeight.w400,),
                    ],
                  ),
                ),

                ListTile(
                  title: TextStyleWidget(title: 'Help Center', size: 16,weight: FontWeight.w500,color: MyColors.black,),
                  trailing: GestureDetector(
                      onTap: (){
                        setState(() {
                          helpCenter = !helpCenter;
                        });
                      },
                      child: SvgPicture.asset(helpCenter ? MyImg.arrowUp : MyImg.arrowDown)),
                ),
                SizedBox(height: 10.h,),
                if(helpCenter) Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleWidget(title: 'How do I buy on MallofTurkeya?', size: 18,color: MyColors.black,weight: FontWeight.w500,),
                      SizedBox(height: 5.h,),
                      TextStyleWidget(title: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        size: 14,color: MyColors.grey50,weight: FontWeight.w400,),
                      SizedBox(height: 20.h,),
                      TextStyleWidget(title: 'Will my shipment be delayed due to rain?', size: 18,color: MyColors.black,weight: FontWeight.w500,),
                      SizedBox(height: 5.h,),
                      TextStyleWidget(title: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        size: 14,color: MyColors.grey50,weight: FontWeight.w400,),
                      SizedBox(height: 20.h,),
                      TextStyleWidget(title: 'How do I buy on MallofTurkeya?', size: 18,color: MyColors.black,weight: FontWeight.w500,),
                      SizedBox(height: 5.h,),
                      TextStyleWidget(title: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        size: 14,color: MyColors.grey50,weight: FontWeight.w400,),
                      SizedBox(height: 20.h,),
                      TextStyleWidget(title: 'Will my shipment be delayed due to rain?', size: 18,color: MyColors.black,weight: FontWeight.w500,),
                      SizedBox(height: 5.h,),
                      TextStyleWidget(title: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        size: 14,color: MyColors.grey50,weight: FontWeight.w400,),
                      SizedBox(height: 20.h,),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
