// ignore_for_file: deprecated_member_use, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mallturkeya/Ui/view/Privacy/privacy.dart';
import 'package:mallturkeya/Ui/view/home/widgets/freeship_widget.dart';
import 'package:mallturkeya/resp/colors/colors.dart';
import 'package:mallturkeya/resp/images/myimages.dart';
import 'package:mallturkeya/resp/widget/banner2_widget.dart';
import 'package:mallturkeya/resp/widget/banner_widget.dart';
import 'package:mallturkeya/Ui/view/home/widgets/flashdeal_widget.dart';
import 'package:mallturkeya/Ui/view/home/widgets/home_category_widget.dart';
import 'package:mallturkeya/resp/widget/category_card_widget.dart';
import 'package:mallturkeya/resp/widget/customrow_widget.dart';
import 'package:mallturkeya/resp/widget/scoial_button_widget.dart';
import 'package:mallturkeya/Ui/view/home/widgets/slider_widget.dart';
import 'package:mallturkeya/resp/widget/small_banner_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List imgList4 = [
    {
      'id': 1,
      "image_path": MyImg.glass,
    },
    {
      'id': 2,
      "image_path": MyImg.glass,
    },
    {
      'id': 3,
      "image_path": MyImg.glass,
    },
    {
      'id': 4,
      "image_path": MyImg.glass,
    },
  ];

  List imgList2 = [
    {'id': 1, "image_paths": MyImg.sweet1, "title": "Turkish \n Delights"},
    {'id': 2, "image_paths": MyImg.sweet3, "title": "Coffee \n & Tea"},
    {'id': 3, "image_paths": MyImg.sweet2, "title": "Turkish \n Flavor"},
    {'id': 4, "image_paths": MyImg.sweet4, "title": "Home & Lifestyle"},
    {'id': 5, "image_paths": MyImg.sweet3, "title": "Coffee \n & Tea"},
    {'id': 6, "image_paths": MyImg.sweet6, "title": "Turkish snacks & chocolate"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.greyligth,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.center,
            width: 45,
            height: 144.h,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 248, 10, 10),
              borderRadius: BorderRadius.circular(10),
            ),
            child: RotatedBox(
              quarterTurns: 3, // Rotates the child by 90 degrees (quarter turn)
              child: const Text(
                "Free shipping",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SocailButtonWidget(
            img: "assets/images/arrowups.png",
            onPressed: () {},
            backgroundColor: const Color.fromARGB(255, 248, 10, 10),
          ),
          const SizedBox(height: 10),
          SocailButtonWidget(
            img: "assets/images/whatsapp.png",
            onPressed: () {},
            backgroundColor: const Color(0xFF25D366),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///// Sliders //////////////////////////
            const SliderWidget(),
            /////  after banner Section /////////////////
            SizedBox(height: 8.h),
            SizedBox(
              width: double.infinity,
              height: 134.h,
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  const SmallBannerWidget(
                    condition: true,
                    img: MyImg.bageimg,
                    title: "100% Authentic from Trusted Brand",
                    img2: MyImg.frameimg,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(Privacy());
                    },
                    child: const SmallBannerWidget(
                        img: MyImg.tick,
                        title: "MOT Commitments",
                        condition: false),
                  ),
                ],
              ),
            ),

            SizedBox(height: 5.h),

            // Category
            const HomeCategoriesWidget(),
            SizedBox(height: 15.h),
            const Banners(),
            SizedBox(height: 15.h),
            const FlashDealWidget(),
            SizedBox(height: 15.h),
            const Banner2Widget(),
            SizedBox(height: 15.h),
            Container(
              width: double.infinity,
              height: 340.h,
              color: MyColors.whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        const Text(
                          "Free Shipping",
                          style: TextStyle(
                              color: MyColors.grey1,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        SvgPicture.asset(
                          MyImg.arrow1,
                          width: 18,
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: imgList4.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return FreeShipCardWidget(
                            img: imgList4[index]['image_path'],
                            title: "A set of 3 Trendy",
                            title2: "Sunglasses in Different...",
                            newprice: "\$${68.00}",
                            oldprice: "\$${70.0}",
                          );
                        }),
                  )
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              width: double.infinity,
              height: 700.h,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  CustomRow(img: MyImg.arrowForward, title: "Just for you"),
                  SizedBox(height: 4.h),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 1.0,
                      mainAxisExtent: 260.h,
                    ),
                    itemCount: imgList4.length,
                    itemBuilder: (context, index) {
                      return CategoryCardWidget(
                        onpressed: (){
                          print("ok");
                        },
                        img: imgList4[index]['image_path'],
                        title: "Arifoglu Natural Active",
                        title2: "Carbon Soap 125g",
                        newprice: "\$${68.00}",
                        oldprice: "\$${70.0}",
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
