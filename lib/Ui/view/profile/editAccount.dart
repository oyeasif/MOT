// ignore_for_file: unused_field, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mallturkeya/resp/colors/colors.dart';
import 'package:mallturkeya/Ui/view/profile/profile_view.dart';
import 'package:mallturkeya/resp/widget/ButtonWidget.dart';
import 'package:mallturkeya/resp/widget/TextWidget.dart';

import '../../../resp/images/myimages.dart';
import '../../../resp/widget/country-codes.dart';
import '../../../resp/widget/custom_text.dart';
import '../../../resp/widget/phone_filed_widget.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {

  Map<String, String>? selectedCountry;
  int _currentIndex = 0;

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
                  TextStyleWidget(title: 'EDIT PROFILE', size: 19,color: MyColors.black,weight: FontWeight.w500,),
                  SizedBox(width: 50.w,)
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            TextFormField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Name',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 2,
                    color: MyColors.fields, // Set your desired enabled border color here
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 2,
                    color: MyColors.fields, // Set your desired enabled border color here
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: MyColors.fields, // Set your desired border color here
                    width: 2.0, // Set the border width
                  ),
                ),
                child: MyForm()
            ),
            SizedBox(height: 10.h,),
            TextFormField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Change Password',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 2,
                    color: MyColors.fields, // Set your desired enabled border color here
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 2,
                    color: MyColors.fields, // Set your desired enabled border color here
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            ButtonWidget(
                onPress: (){},
                title: 'UPDATE INFORMATION', buttonColor: MyColors.selectColors, textColor: MyColors.whiteColor, buttonBorderColor: MyColors.selectColors)
          ],
        ),
      ),
    );
  }
}

