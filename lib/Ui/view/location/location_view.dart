import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mallturkeya/Ui/view/location/personal%20info_location.dart';
import 'package:mallturkeya/resp/colors/colors.dart';
import 'package:mallturkeya/resp/widget/ButtonWidget.dart';
import 'package:mallturkeya/resp/widget/TextWidget.dart';
import '../../../resp/images/myimages.dart';
import '../../../resp/widget/customappbar_widget.dart';
import '../cart/cart_view.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(33.99976204930803, 71.47600403723713),
    zoom: 14.4746,
  );
  final double circleRadius = 100.0;
  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(33.99976204930803, 71.47600403723713),
      infoWindow: InfoWindow(),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

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
        cartBadgeCount: 2,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            mapType: MapType.normal,
            markers: Set<Marker>.of(_marker),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
              top: 10.h,
              left: 10,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: 414,
                  height: 57,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        hintText: "Search Shor Address",
                        hintStyle: GoogleFonts.dmSans(
                          fontStyle: FontStyle.normal,
                          color: const Color(0xff9B9B9B),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              )),
          Positioned(
              top: 380.h,
              left: 10.w,
              right: 10.w,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    width: 414.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: MyColors.greyligth),
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                      ),
                      title: TextStyleWidget(
                        title:
                            "2f28+2xx, Taroon Wedding Hall RD, Canal Town Peshawar, Khyber Pakhtunkhwa2500",
                        size: 14,
                        weight: FontWeight.w400,
                      ),
                    )),
              )),
          Positioned(
              top: 500.h,
              left: 20.w,
              right: 19.w,
              bottom: 5.h,
              child: ButtonWidget(
                  title: "Continue Location",
                  buttonColor: MyColors.recolor,
                  textColor: MyColors.whiteColor,
                  buttonBorderColor: MyColors.recolor,
                  onPress: () {
                    Get.to(() => const PersonalinfolocationView());
                  })),
        ],
      ),
    );
  }
}
