import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mallturkeya/Ui/view/phone/otp_view.dart';
import 'package:mallturkeya/resp/colors/colors.dart';
import 'package:mallturkeya/resp/images/myimages.dart';
import 'package:mallturkeya/resp/widget/ButtonWidget.dart';
import 'package:mallturkeya/resp/widget/TextWidget.dart';
import 'package:mallturkeya/resp/widget/customappbar_widget.dart';

import '../../../resp/widget/phone_filed_widget.dart';

class PhoneView extends StatefulWidget {
  const PhoneView({super.key});

  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'TR';
  String phoneNumber = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        logoImagePath: MyImg.logo,
        searchIconPath: MyImg.Searchicon,
        onp1: () {
          print("search button call");
        },
        cartIconPath: MyImg.carticon,
        onp2: () {
          print("cart button call");
        },
        cartBadgeCount: 2,
      ),
      body: Column(
        children: [
          SizedBox(height: 40.h),
          Align(
            alignment: Alignment.center,
            child: TextStyleWidget(
              title: "Enter Your Phone Number",
              size: 20,
              color: MyColors.black,
              weight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h),
          TextStyleWidget(
            title: "We will send you the 4 digit verification code",
            size: 15,
            color: MyColors.grey20,
            weight: FontWeight.w400,
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.greyligth,
                ),
                child: Form(
                  key: formKey,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {},
                          onInputValidated: (bool value) {},
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle:
                              const TextStyle(color: MyColors.hintgrey),
                          textStyle: const TextStyle(color: MyColors.black),
                          initialValue: PhoneNumber(isoCode: initialCountry),
                          textFieldController: TextEditingController(),
                          inputDecoration: InputDecoration(
                            hintText: "Phone number here",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: MyColors.hintgrey,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonWidget(
              title: "SEND OTP",
              buttonColor: MyColors.recolor,
              textColor: MyColors.whiteColor,
              buttonBorderColor: Colors.transparent,
              onPress: () {
                Get.to(() =>const OtpView());
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
