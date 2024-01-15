import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mallturkeya/Ui/view/home/thanksScreen.dart';
import 'package:mallturkeya/resp/widget/ButtonWidget.dart';
import 'package:mallturkeya/resp/widget/TextWidget.dart';

import '../../../resp/colors/colors.dart';
import '../../../resp/images/myimages.dart';
import '../../../resp/widget/customappbar_widget.dart';
import '../cart/cart_view.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
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
          Get.to(() => const CartView());
        },
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  color: MyColors.greyligth,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle back button press
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Back",
                        style: GoogleFonts.dmSans(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: MyColors.black,
                          letterSpacing: 0.15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "ORDER SUMMARY",
                          style: GoogleFonts.dmSans(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black.withOpacity(0.87),
                            letterSpacing: 0.15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFD3DAF0)),
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                            width: 364,
                            height: 166,
                            child: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                    target: LatLng(0.0, 0.0),zoom: 14))
                        ),
                        SizedBox(height: 10.h,),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: MyColors.redlight,
                                child: SvgPicture.asset(MyImg.location),
                              ),
                              SizedBox(width: 10.w,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextStyleWidget(title: 'Address', size: 14,color: MyColors.black,weight: FontWeight.w400,),
                                        TextStyleWidget(title: 'Change', size: 12,color: MyColors.selectColors,weight: FontWeight.w400,decoration: TextDecoration.underline,),
                                      ],
                                    ),
                                    TextStyleWidget(title: '2f28+2xx, Taroon Wedding Hall RD, Canal Town Peshawar, Khyber Pakhtunkhwa', size: 14,color: MyColors.unslectColors,weight: FontWeight.w400,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextStyleWidget(title: 'View Cart Items', size: 18,weight: FontWeight.w500,color: MyColors.black,),
                      SvgPicture.asset(MyImg.arrowDown),
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                Divider(),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextStyleWidget(title: 'Add coupon code', size: 18,weight: FontWeight.w500,color: MyColors.black,),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextStyleWidget(title: 'Please use 10MOT to get 10% off', size: 12,weight: FontWeight.w500,color: MyColors.orangeColor,),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText:  'Enter your promo code',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: MyColors.unslectColors),
                      ),
                      suffixIcon: SvgPicture.asset(MyImg.arrow_forward),
                    ),
                  ),
                ),
                SizedBox(height: 5.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextStyleWidget(title: 'you will get 30% off on this purchase', size: 13,weight: FontWeight.w400,color: MyColors.grey60,),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(color: Color(0x91EFF0F2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleWidget(title: 'Price Details', size: 14,color: MyColors.black,weight: FontWeight.w500,),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextStyleWidget(title: 'Price (2 item)', size: 17,color: MyColors.black,weight: FontWeight.w400,),
                          TextStyleWidget(title: '\$68.00', size: 17,color: MyColors.grey50,weight: FontWeight.w400,),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextStyleWidget(title: 'You saved', size: 17,color: MyColors.black,weight: FontWeight.w400,),
                          TextStyleWidget(title: '-\$2.00', size: 17,color: MyColors.greencolor20,weight: FontWeight.w400,),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextStyleWidget(title: 'Shipping charges', size: 17,color: MyColors.black,weight: FontWeight.w400,),
                          TextStyleWidget(title: 'Free Delivery', size: 17,color: MyColors.greencolor20,weight: FontWeight.w400,),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Container(
                        width: 400,
                        height: 2,
                        color: MyColors.greyligth,
                        child: CustomPaint(
                          painter: DottedLinePainter(),
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextStyleWidget(title: 'Total Amount', size: 17,color: MyColors.black,weight: FontWeight.w500,),
                          TextStyleWidget(title: '\$66.00', size: 17,color: MyColors.black,weight: FontWeight.w500,),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextStyleWidget(title: 'Shipping Method', size: 18,color: MyColors.black,weight: FontWeight.w500,),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextStyleWidget(title: 'Free Shipping', size: 15,color: MyColors.black,weight: FontWeight.w500,),
                      TextStyleWidget(title: '\$ 0.00', size: 15,color: MyColors.black,weight: FontWeight.w500,),
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextStyleWidget(title: 'Customs fees are not included, if any Preparing for shipping time 1 to 3 business daysShipping and delivery time 2 to 4 business days',
                    size: 15,color: MyColors.grey80,weight: FontWeight.w400,),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Image(image: AssetImage(MyImg.image68)),
                      SizedBox(width: 30.w,),
                      Image(image: AssetImage(MyImg.image69)),

                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(color: Color(0x91EFF0F2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyleWidget(title: 'Payment Method', size: 18,color: MyColors.black,weight: FontWeight.w500,),
                      SizedBox(height: 10,),
                      Container(
                        decoration: ShapeDecoration(
                          color: Color(0x0CE72128),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: MyColors.selectColors),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          children: [
                            Radio(value: 1, groupValue: 1, onChanged: (value){},),
                            TextStyleWidget(title: 'Cash on Delivery', size: 14,color: MyColors.black,weight: FontWeight.w400,),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: MyColors.grey60),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Radio(value: 0, groupValue: 1, onChanged: (value){},),
                            Image(image: AssetImage(MyImg.image71)),
                            Image(image: AssetImage(MyImg.visa)),
                            Image(image: AssetImage(MyImg.master)),
                            Image(image: AssetImage(MyImg.image60)),
                            Image(image: AssetImage(MyImg.amex)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h,),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Checkbox(value: isBlank, onChanged: (value){}),
                    TextStyleWidget(title: 'I have read and agree to the ', size: 14,color: MyColors.black,weight: FontWeight.w400,),
                    Expanded(child: TextStyleWidget(title: 'Terms & Condition ', size: 14,color: MyColors.black,weight: FontWeight.w700,decoration: TextDecoration.underline,)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ButtonWidget(
                title: 'PAY NOW',
                buttonColor: MyColors.selectColors,
                textColor: MyColors.whiteColor,
                buttonBorderColor: MyColors.selectColors,
                onPress: (){
                  Get.to(ThanksScreen());
                }),
          )
        ],
      ),
    );
  }
}