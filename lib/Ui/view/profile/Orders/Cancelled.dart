// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mallturkeya/resp/widget/TextWidget.dart';

import 'package:mallturkeya/resp/colors/colors.dart';

import '../../../../resp/images/myimages.dart';

class Cancelled extends StatefulWidget {
  const Cancelled({Key? key}) : super(key: key);

  @override
  State<Cancelled> createState() => _CancelledState();
}

class _CancelledState extends State<Cancelled> {
  bool isContentVisible = true;
  Map<String, String>? selectedCountry;
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(33.99976204930803, 71.47600403723713),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
          ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Color(0xFFD3DAF0)),
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 46,
                              height: 46,
                              decoration: const ShapeDecoration(
                                color: Color(0x33E72128),
                                shape: OvalBorder(),
                              ),
                              child: Center(child: SvgPicture.asset(MyImg.lock)),
                            ),
                            SizedBox(width: 10.w,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextStyleWidget(title: 'Adnan Sami', size: 14,weight: FontWeight.w600,color: MyColors.black,),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isContentVisible = !isContentVisible;
                                          });
                                        },
                                        child: isContentVisible ? SvgPicture.asset(MyImg.arrowUp) : SvgPicture.asset(MyImg.arrowDown),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextStyleWidget(title: 'Order ID: ', size: 14,weight: FontWeight.w400,color: MyColors.black,),
                                      TextStyleWidget(title: '8363454', size: 14,weight: FontWeight.w400,color: MyColors.black,),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextStyleWidget(title: '12/16/2023 | 08 PM. ', size: 14,weight: FontWeight.w400,color: MyColors.unslectColors,),
                                      TextStyleWidget(title: 'Cancelled', size: 14,weight: FontWeight.w400,color: MyColors.selectColors,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (isContentVisible)SizedBox(
                          height: 10.h,
                        ),
                        if (isContentVisible)
                          Container(
                            width: 364.w,
                            height: 166.h,
                            decoration: ShapeDecoration(
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: GoogleMap(
                              zoomControlsEnabled: false,
                              initialCameraPosition: _kGooglePlex,
                            ),
                          ),
                        if (isContentVisible) SizedBox(height: 10.h,),
                        if (isContentVisible) Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 46,
                              height: 46,
                              decoration: const ShapeDecoration(
                                color: Color(0x33E72128),
                                shape: OvalBorder(),
                              ),
                              child: Center(child: SvgPicture.asset(MyImg.location)),
                            ),
                            SizedBox(width: 10.w,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextStyleWidget(title: 'Address', size: 14,weight: FontWeight.w400,color: MyColors.black,),
                                  TextStyleWidget(title: '2f28+2xx, Taroon Wedding Hall RD, Canal Town Peshawar, Khyber Pakhtunkhwa ', size: 14,weight: FontWeight.w400,color: MyColors.unslectColors,),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (isContentVisible) const Divider(),
                        if (isContentVisible) TextStyleWidget(title: 'Track Order', size: 16,color: MyColors.black,weight: FontWeight.w600,),
                        if (isContentVisible) Stepper(
                            physics: const BouncingScrollPhysics(),
                            steps: [
                              Step(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextStyleWidget(title: 'Order Placed', size: 14,weight: FontWeight.w600,color: MyColors.black,),
                                    Expanded(child: TextStyleWidget(title: '12/16/2023 | 08 PM', size: 12,weight: FontWeight.w400,color: MyColors.unslectColors,)),
                                  ],
                                ),
                                subtitle: TextStyleWidget(title: 'We have received your order', size: 12,weight: FontWeight.w400,color: MyColors.grey40,),
                                content: Container(
                                  child: const Center(
                                    child: Text(''),
                                  ),
                                ),
                              ),
                              Step(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextStyleWidget(title: 'Order Placed', size: 14,weight: FontWeight.w600,color: MyColors.black,),
                                    Expanded(child: TextStyleWidget(title: '12/16/2023 | 08 PM', size: 12,weight: FontWeight.w400,color: MyColors.unslectColors,)),
                                  ],
                                ),
                                subtitle: TextStyleWidget(title: 'We have received your order', size: 12,weight: FontWeight.w400,color: MyColors.grey40,),
                                content: Container(
                                  child: const Center(
                                    child: Text(''),
                                  ),
                                ),
                              ),
                              Step(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,                          children: [
                                  TextStyleWidget(title: 'Order Placed', size: 14,weight: FontWeight.w600,color: MyColors.black,),
                                  Expanded(child: TextStyleWidget(title: '12/16/2023 | 08 PM', size: 12,weight: FontWeight.w400,color: MyColors.unslectColors,)),
                                ],
                                ),
                                subtitle: TextStyleWidget(title: 'We have received your order', size: 12,weight: FontWeight.w400,color: MyColors.grey40,),
                                content: Container(
                                  child: const Center(
                                    child: Text(''),
                                  ),
                                ),
                              ),
                              Step(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,                          children: [
                                  TextStyleWidget(title: 'Order Placed', size: 14,weight: FontWeight.w600,color: MyColors.black,),
                                  Expanded(child: TextStyleWidget(title: '12/16/2023 | 08 PM', size: 12,weight: FontWeight.w400,color: MyColors.unslectColors,)),
                                ],
                                ),
                                subtitle: TextStyleWidget(title: 'We have received your order', size: 12,weight: FontWeight.w400,color: MyColors.grey40,),
                                content: Container(
                                  child: const Center(
                                    child: Text(''),
                                  ),
                                ),
                              ),

                            ]
                        ),
                        if (isContentVisible) Container(
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: MyColors.backGroundColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextStyleWidget(title: 'Price Details', size: 16,color: MyColors.black,weight: FontWeight.w600,),
                              SizedBox(height: 10.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextStyleWidget(title: 'Price (2 items)', size: 12,color: MyColors.black,weight: FontWeight.w400,),
                                  TextStyleWidget(title: '\$68.00', size: 12,color: MyColors.unslectColors,weight: FontWeight.w400,),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextStyleWidget(title: 'You Saved', size: 12,color: MyColors.black,weight: FontWeight.w400,),
                                  TextStyleWidget(title: '-\$2.00', size: 12,color: MyColors.greencolor,weight: FontWeight.w400,),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextStyleWidget(title: 'Shopping Charges', size: 12,color: MyColors.black,weight: FontWeight.w400,),
                                  TextStyleWidget(title: 'Free Delivery', size: 12,color: MyColors.greencolor,weight: FontWeight.w400,),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              const Divider(),
                              SizedBox(height: 10.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextStyleWidget(title: 'Total Amount', size: 12,color: MyColors.black,weight: FontWeight.w400,),
                                  TextStyleWidget(title: '\$66.00', size: 12,color: MyColors.unslectColors,weight: FontWeight.w600,),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
      ),
    );
  }
}
