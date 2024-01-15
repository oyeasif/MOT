import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mallturkeya/Ui/view/location/location_view.dart';
import 'package:mallturkeya/resp/widget/ButtonWidget.dart';
import 'package:pinput/pinput.dart';

import '../../../resp/colors/colors.dart';
import '../../../resp/images/myimages.dart';
import '../../../resp/widget/TextWidget.dart';
import '../../../resp/widget/customappbar_widget.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = MyColors.fields;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = MyColors.fields;

    final defaultPinTheme = PinTheme(
      width: 70,
      height: 55,
      textStyle: const TextStyle(
        fontSize: 22,
        color: MyColors.fields,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
    );
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: TextStyleWidget(
                title: "Verify your phone number",
                size: 20,
                color: MyColors.black,
                weight: FontWeight.w500,
              ),
            ),
            TextStyleWidget(
              title: "Enter Your OTP code here",
              size: 15,
              color: MyColors.grey20,
              weight: FontWeight.w400,
            ),
            SizedBox(height: 10.h),
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                    // Specify direction if desired
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                      controller: pinController,
                      focusNode: focusNode,
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                      listenForMultipleSmsOnAndroid: true,
                      defaultPinTheme: defaultPinTheme,
                      separatorBuilder: (index) => const SizedBox(width: 10),
                      validator: (value) {
                        return value == '2222' ? null : 'Pin is incorrect';
                      },
                      // onClipboardFound: (value) {
                      //   debugPrint('onClipboardFound: $value');
                      //   pinController.setText(value);
                      // },

                      onCompleted: (pin) {
                        debugPrint('onCompleted: $pin');
                      },
                      onChanged: (value) {
                        debugPrint('onChanged: $value');
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: focusedBorderColor,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: fillColor,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextStyleWidget(
                    title: "Didn’t you receive any code?",
                    size: 16,
                    weight: FontWeight.w400,
                    color: MyColors.grey70,
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                      onTap: () {},
                      child: TextStyleWidget(
                        title: "RESEND NEW CODE",
                        size: 18,
                        weight: FontWeight.w700,
                        color: MyColors.recolor,
                      )),
                  SizedBox(height: 50.h),
                  ButtonWidget(
                    title: "Continue",
                    buttonColor: MyColors.recolor,
                    textColor: MyColors.whiteColor,
                    buttonBorderColor: Colors.transparent,
                    onPress: () {
                      Get.to(()=> const LocationView());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
