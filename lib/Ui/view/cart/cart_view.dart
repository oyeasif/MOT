import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mallturkeya/Ui/view/cart/cartwidget/cart_widget.dart';
import 'package:mallturkeya/Ui/view/phone/phone_view.dart';
import 'package:mallturkeya/data/models/cart_model.dart'; // Import the ProductModel
import 'package:mallturkeya/resp/colors/colors.dart';
import 'package:mallturkeya/resp/images/myimages.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:mallturkeya/resp/widget/TextWidget.dart';

import '../../../animation/scaletransition_animation.dart';
import '../../../resp/widget/customappbar_widget.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  ProductModel product = ProductModel(
    name: "headphones",
    color: "Black",
    size: "L",
    quantity: 1,
    imagePath: MyImg.headphone,
    deleteIconPath: MyImg.deleteicon,
    date: "12:12:2021",
    price: 160.0,
  );
  List<ProductModel> products = [
    ProductModel(
      name: "Headphones",
      color: "Black",
      size: "L",
      quantity: 1,
      imagePath: MyImg.headphone,
      deleteIconPath: MyImg.deleteicon,
      date: "12:12:2021",
      price: 160.0,
    ),
    ProductModel(
      name: "Smartphone",
      color: "Silver",
      size: "L",
      quantity: 1,
      imagePath: MyImg.headphone,
      deleteIconPath: MyImg.deleteicon,
      date: "12:13:2021",
      price: 699.0,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      appBar: CustomAppBarWidget(
        logoImagePath: MyImg.logo,
        searchIconPath: MyImg.Searchicon,
        onp1: () {
          print("search button call");
        },
        cartIconPath: MyImg.carticon,
        onp2: () {
          Get.to(()=> CartView());
        },
        cartBadgeCount: 2,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: 50.h,
                  color: MyColors.grey5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      "Cart",
                      style: GoogleFonts.dmSans(
                        fontSize: 19,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(0, 0, 0, 0.87),
                        letterSpacing: 0.15,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 280.h,
                  color: MyColors.greyligth,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      ProductModel product = products[index];
                      return CardItemWidget(
                        img: product.imagePath,
                        productname: product.name,
                        color: product.color,
                        size: product.size,
                        quantity: product.quantity,
                        date: product.date,
                        price: product.price,
                        deleteIconPath: product.deleteIconPath,
                      );
                    },
                  ),
                ),
                SizedBox(height: 2.h),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 140.h,
                  color: MyColors.whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add coupon code",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          color: MyColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Please use 10MOT to get 10% off",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          color: MyColors.orange,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.24,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        width: 373.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: MyColors.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xffE2E2E2),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(8),
                                  hintText: "Enter your promo code",
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
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.arrow_forward,
                                color: MyColors.recolor,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "you will get 30% off on this purchase",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xff7D7676),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.24,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 200.h,
                  color: MyColors.greyligth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Text(
                        "Price Details",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          color: MyColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Price( 2 item)",
                            style: GoogleFonts.dmSans(
                              fontSize: 17,
                              fontStyle: FontStyle.normal,
                              color: MyColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "\$${68.00}",
                            style: GoogleFonts.dmSans(
                              fontSize: 17,
                              fontStyle: FontStyle.normal,
                              color: MyColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "You Saved",
                            style: GoogleFonts.dmSans(
                              fontSize: 17,
                              fontStyle: FontStyle.normal,
                              color: MyColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "- \$${2.00}",
                            style: GoogleFonts.dmSans(
                              fontSize: 17,
                              fontStyle: FontStyle.normal,
                              color: MyColors.greencolor,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping charges",
                            style: GoogleFonts.dmSans(
                              fontSize: 17,
                              fontStyle: FontStyle.normal,
                              color: MyColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Free Delivery",
                            style: GoogleFonts.dmSans(
                              fontSize: 17,
                              fontStyle: FontStyle.normal,
                              color: MyColors.greencolor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        width: 400,
                        height: 2,
                        color: MyColors.greyligth,
                        child: CustomPaint(
                          painter: DottedLinePainter(),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount",
                            style: GoogleFonts.dmSans(
                              fontSize: 17,
                              fontStyle: FontStyle.normal,
                              color: MyColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "\$${392.00}",
                            style: GoogleFonts.dmSans(
                              fontSize: 17,
                              fontStyle: FontStyle.normal,
                              color: MyColors.greencolor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.to(() => PhoneView());
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextStyleWidget(
                  title: "Check out",
                  size: 14,
                  weight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;

    final double dashWidth = 5.0;
    final double dashSpace = 5.0;

    double currentX = 0;

    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, 0),
        Offset(currentX + dashWidth, 0),
        paint,
      );

      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
