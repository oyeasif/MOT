import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mallturkeya/Ui/view/location/OrderSummary.dart';
import 'package:mallturkeya/Ui/view/location/widget/location_filed_widget.dart';
import 'package:mallturkeya/resp/colors/colors.dart';
import 'package:mallturkeya/resp/widget/TextWidget.dart';
import '../../../resp/images/myimages.dart';
import '../../../resp/widget/ButtonWidget.dart';
import '../../../resp/widget/customappbar_widget.dart';
import '../../../resp/widget/dropdown_widget.dart';
import '../cart/cart_view.dart';

class PersonalinfolocationView extends StatefulWidget {
  const PersonalinfolocationView({super.key});

  @override
  State<PersonalinfolocationView> createState() =>
      _PersonalinfolocationViewState();
}

class _PersonalinfolocationViewState extends State<PersonalinfolocationView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'TR';
  String phoneNumber = '';
  String defaultvalue = '';
  int selectedButtonIndex = 0;
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.99976204930803, 71.47600403723713),
    zoom: 11.4746,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 57.5,
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
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      "DETAILS",
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
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 375.w,
                height: 55.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MyColors.fields, width: 1),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    dropdownColor: Colors.white,
                    value: defaultvalue,
                    isExpanded: true,
                    menuMaxHeight: 350,
                    hint: Padding(
                      padding: const EdgeInsets.only(left: 14, right: 22),
                      child: Text(
                        "Select Governorate",
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff81889F),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/icons/dropdownicons.svg",
                        color: MyColors.black,
                      ),
                    ),
                    items: null,
                    onChanged: (value) {
                      setState(() {
                        defaultvalue = value!;
                      });
                    },
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton(0, 'Home'),
                  buildButton(1, 'Office'),
                  buildButton(2, 'Other'),
                ],
              ),
            ),
            LocationTextFieldWidget(
              hint: "Building Number 5250",
              width: 375.w,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LocationTextFieldWidget(hint: "3rd Floor", width: 160.0),
                LocationTextFieldWidget(hint: "Unit Number 456", width: 160.0),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: TextStyleWidget(
                title: "Personal Details",
                size: 16,
                weight: FontWeight.w600,
                color: MyColors.black,
              ),
            ),
            LocationTextFieldWidget(
              hint: "Adnan Sami",
              width: 375.w,
              icon: Icons.person_outline,
            ),
            LocationTextFieldWidget(
              hint: "adnansamibtk@gmail.com",
              width: 375.w,
              icon: Icons.email_outlined,
            ),
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
                          selectorTextStyle: const TextStyle(
                            color: MyColors.hintgrey,
                          ),
                          textStyle: const TextStyle(
                            color: MyColors.black,
                          ),
                          initialValue: PhoneNumber(isoCode: initialCountry),
                          textFieldController: TextEditingController(),
                          inputDecoration: InputDecoration(
                            hintText: "348 19 20772",
                            hintStyle: GoogleFonts.dmSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: MyColors.black.withOpacity(0.7),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: TextStyleWidget(
                title: "Order Notes (Optional)",
                size: 10,
                weight: FontWeight.w600,
                color: MyColors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
              child: Container(
                width: 375.w,
                height: 80.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Color(0xffD3DAF0),
                    width: 1,
                  ),
                ),
                child: TextField(
                  maxLines: 9,
                  minLines: 1,
                  maxLength: 9,

                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintText: "Note About Your Order",
                    helperStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff333),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonWidget(
                title: "Continue",
                buttonColor: MyColors.recolor,
                textColor: MyColors.whiteColor,
                buttonBorderColor: Colors.transparent,
                onPress: () {
                 Get.to(()=> const OrderSummary());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(int index, String text) {
    bool isSelected = index == selectedButtonIndex;

    return InkWell(
      onTap: () {
        setState(() {
          selectedButtonIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100.0,
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
              color: isSelected ? MyColors.recolor : MyColors.fields,
              width: 1,
            ),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.red : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
