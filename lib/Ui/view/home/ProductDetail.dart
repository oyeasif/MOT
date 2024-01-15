import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mallturkeya/Ui/view/cart/cart_view.dart';
import 'package:mallturkeya/Ui/view/home/home_view.dart';
import 'package:mallturkeya/resp/colors/colors.dart';
import 'package:mallturkeya/resp/images/myimages.dart';
import 'package:mallturkeya/resp/widget/ButtonWidget.dart';
import 'package:mallturkeya/resp/widget/TextWidget.dart';
import 'package:mallturkeya/resp/widget/rating_widget.dart';
import '../../../resp/widget/customappbar_widget.dart';
import '../../../resp/widget/small_banner_widget.dart';

class ViewItem extends StatefulWidget {
  const ViewItem({Key? key}) : super(key: key);

  @override
  State<ViewItem> createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {
  int currentIndex = 0;
  List imgList = [
    {'id': 1, "image_path": MyImg.rectangle365},
    {'id': 2, "image_path": MyImg.rectangle365},
    {'id': 3, "image_path": MyImg.rectangle365},
    {'id': 4, "image_path": MyImg.rectangle365},
    {'id': 5, "image_path": MyImg.rectangle365},
  ];
  final CarouselController carousalController = CarouselController();

  int isColorSelectedList = 0;
  int isSizeSelectedList = 0;

  List<Color> colorList = [
    const Color(0xFF6BC0FF),
    const Color(0xFF5079D8),
    const Color(0xFF91A9FF),
    const Color(0xFF91A9FF),
    const Color(0xFFFCDBA4),
    const Color(0xFF385D77),
    const Color(0xFF5E8DA0),
    const Color(0xFFA3C4D1),
  ];
  List<String> sizeList = ['S', 'M', 'L', 'XL'];

  bool showAllComments = false;

  Map<String, String>? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backGroundColor,
      extendBody: true,
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
          Expanded(
            child: ListView(
              children: [
                Stack(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: CarouselSlider(
                        items: imgList
                            .map((item) => ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    item["image_path"],
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  ),
                                ))
                            .toList(),
                        carouselController: carousalController,
                        options: CarouselOptions(
                            scrollPhysics: const BouncingScrollPhysics(),
                            autoPlay: true,
                            aspectRatio: 1,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            }),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        left: 100,
                        right: 120,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: imgList.asMap().entries.map((entry) {
                              print(entry);
                              return GestureDetector(
                                onTap: () =>
                                    carousalController.animateToPage(entry.key),
                                child: Container(
                                  width: currentIndex == entry.key ? 15 : 15,
                                  height: 5.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: currentIndex == entry.key
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        )),
                    Positioned(
                      top: 20,
                      left: 300,
                      right: 10,
                      child: Column(
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.favorite_outline_outlined,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          padding: const EdgeInsets.all(10),
                                          width: double.infinity,
                                          child: ListView(
                                            children: [
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Image(
                                                    height: 80,
                                                    width: 80,
                                                    image:
                                                        AssetImage(MyImg.glass),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'Trendy Glasses',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            color:
                                                                MyColors.black),
                                                      ),
                                                      const Row(
                                                        children: [
                                                          Text(
                                                            'Seller: ',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: MyColors
                                                                    .black),
                                                          ),
                                                          Text('Veno ',
                                                              style: TextStyle(
                                                                  color: MyColors
                                                                      .black)),
                                                          Text(
                                                            'Color: ',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: MyColors
                                                                    .black),
                                                          ),
                                                          Text('Black ',
                                                              style: TextStyle(
                                                                  color: MyColors
                                                                      .black)),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            '\$${646}: ',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: MyColors
                                                                    .black),
                                                          ),
                                                          const SizedBox(
                                                            width: 40,
                                                          ),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0.1),
                                                            width: 50,
                                                            height: 15,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: Colors.red,
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            child: const Text(
                                                              'Qty: ${2}',
                                                              style: TextStyle(
                                                                  fontSize: 8,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              const Divider(
                                                color: Colors.grey,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text(
                                                'Please write your review \nabout our product',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: MyColors.black),
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: CustomRatingBar(
                                                    starCount: 5,
                                                    rating: 0,
                                                    onRatingChanged: (value) {},
                                                    size: 40,
                                                  )),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                'Review Images',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: MyColors.black),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const SizedBox(
                                                height: 80,
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Image(
                                                        image: AssetImage(
                                                            MyImg.glass)),
                                                    Image(
                                                        image: AssetImage(
                                                            MyImg.glass)),
                                                    Column(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 20,
                                                          backgroundColor:
                                                              Colors.red,
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.camera_alt,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          'Add your Photos',
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color: MyColors
                                                                  .black),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              const Text(
                                                'Comments',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: MyColors.black),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const TextField(
                                                maxLines: 5,
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  hintText: 'Your review',
                                                  filled: true,
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey)),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              ButtonWidget(
                                                title: "SUBMIT A REVIEW",
                                                buttonColor:
                                                    MyColors.selectColors,
                                                textColor: MyColors.whiteColor,
                                                buttonBorderColor:
                                                    MyColors.selectColors,
                                                onPress: () {},
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                icon: const Icon(
                                  Icons.share,
                                  color: Colors.black,
                                  size: 20,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextStyleWidget(
                    title:
                        'Ramadan Kareem printed cushion cover set of 4 pieces',
                    size: 20,
                    weight: FontWeight.w500,
                    color: MyColors.black,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      CustomRatingBar(
                        starCount: 5,
                        rating: 3,
                        onRatingChanged: (value) {},
                        size: 15,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      TextStyleWidget(
                        title: '(${10})',
                        size: 10,
                        weight: FontWeight.w400,
                        color: MyColors.grey10,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextStyleWidget(
                            title: '\$${234}',
                            size: 20,
                            color: MyColors.selectColors,
                            weight: FontWeight.w700,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          TextStyleWidget(
                            title: '\$${600}',
                            size: 16,
                            color: MyColors.grey50,
                            weight: FontWeight.w700,
                            decoration: TextDecoration.lineThrough,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          TextStyleWidget(
                            title: '${-42}\%',
                            size: 16,
                            color: MyColors.grey50,
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                      TextStyleWidget(
                        title: '(IN STOCK)',
                        size: 13,
                        color: MyColors.greencolor10,
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const SmallBannerWidget(
                  condition: true,
                  img: MyImg.bageimg,
                  title: "100% Authentic from Trusted Brand",
                  img2: MyImg.frameimg,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextStyleWidget(
                    title: 'Securly pay with:',
                    size: 18,
                    weight: FontWeight.w500,
                    color: MyColors.black,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Image(image: AssetImage(MyImg.image59)),
                      const Image(image: AssetImage(MyImg.image60)),
                      const Image(image: AssetImage(MyImg.image64)),
                      const Image(image: AssetImage(MyImg.image65)),
                      const Image(image: AssetImage(MyImg.image62)),
                      Expanded(
                        child: Row(
                          children: [
                            SvgPicture.asset(MyImg.googlepay),
                            TextStyleWidget(
                              title: 'Google Pay',
                              size: 8,
                              color: MyColors.grey10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextStyleWidget(
                    title: 'Select Size',
                    size: 18,
                    weight: FontWeight.w500,
                    color: MyColors.black,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: sizeList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 8),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSizeSelectedList = index;
                              log(sizeList[index].toString());
                            });
                          },
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: ShapeDecoration(
                              color: isSizeSelectedList == index
                                  ? MyColors.black
                                  : MyColors.whiteColor,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: MyColors.unslectColors),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Center(
                              child: TextStyleWidget(
                                title: '${sizeList[index].toString()}',
                                size: 16,
                                weight: FontWeight.w500,
                                color: isSizeSelectedList == index
                                    ? MyColors.whiteColor
                                    : MyColors.unslectColors,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextStyleWidget(
                    title: 'Select Color',
                    size: 18,
                    weight: FontWeight.w500,
                    color: MyColors.black,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: colorList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 8),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isColorSelectedList = index;
                              log(colorList[index].toString());
                            });
                          },
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: ShapeDecoration(
                              shadows: [
                                isColorSelectedList == index
                                    ? BoxShadow(
                                        color: colorList[index],
                                        blurRadius: 7.70,
                                        offset: const Offset(0, 5),
                                        spreadRadius: 0,
                                      )
                                    : const BoxShadow()
                              ],
                              color: colorList[index],
                              shape: RoundedRectangleBorder(
                                  side: isColorSelectedList == index
                                      ? const BorderSide(color: Colors.black)
                                      : BorderSide.none,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextStyleWidget(
                    title: 'Description',
                    size: 18,
                    weight: FontWeight.w500,
                    color: MyColors.black,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextStyleWidget(
                    title: 'Highly Detailed Audio',
                    size: 14,
                    weight: FontWeight.w600,
                    color: MyColors.black,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextStyleWidget(
                    title:
                        'Lorem ipsum dolor sit amet consectetur. Elementum sollicitudin pellentesque commodo volutpat ac imperdiet egestas. Porta sit neque ultricies tempor. Felis morbi viverra sit mattis elementum sed aliquet vulputate. Mauris nullam viverra id mauris arcu.Lorem ipsum dolor sit amet consectetur. Elementum sollicitudin pellentesque commodo volutpat ac imperdiet egestas. Porta sit neque ultricies tempor. Felis morbi viverra sit mattis elementum sed aliquet vulputate. Mauris nullam viverra id mauris arcu.',
                    size: 14,
                    weight: FontWeight.w400,
                    color: MyColors.black,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextStyleWidget(
                    title: 'Reviews (${17})',
                    size: 18,
                    weight: FontWeight.w500,
                    color: MyColors.black,
                  ),
                ),
                ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: showAllComments ? 17 : 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: AssetImage(MyImg.image54),
                            ),
                            title: TextStyleWidget(
                              title: 'Madelina',
                              size: 16,
                              weight: FontWeight.w400,
                              color: MyColors.black,
                            ),
                            subtitle: CustomRatingBar(
                              starCount: 5,
                              rating: 4,
                              onRatingChanged: (value) {},
                            ),
                            trailing: TextStyleWidget(
                              title: '1 Month ago',
                              size: 12,
                              weight: FontWeight.w400,
                              color: MyColors.grey60,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 73.0, right: 15),
                            child: TextStyleWidget(
                              title:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                              size: 14,
                              weight: FontWeight.w400,
                              color: MyColors.black,
                            ),
                          ),
                        ],
                      );
                    }),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      MyImg.divider,
                      width: 120.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showAllComments = !showAllComments;
                        });
                      },
                      child: showAllComments
                          ? Row(
                              children: [
                                TextStyleWidget(
                                  title: 'VIEW LESS',
                                  size: 13,
                                  weight: FontWeight.w700,
                                  color: MyColors.selectColors,
                                ),
                                SvgPicture.asset(
                                  MyImg.arrowUp,
                                  color: MyColors.selectColors,
                                  width: 18,
                                  height: 18,
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                TextStyleWidget(
                                  title: 'VIEW ALL',
                                  size: 13,
                                  weight: FontWeight.w700,
                                  color: MyColors.selectColors,
                                ),
                                SvgPicture.asset(
                                  MyImg.arrowDown,
                                  color: MyColors.selectColors,
                                  width: 18,
                                  height: 18,
                                ),
                              ],
                            ),
                    ),
                    SvgPicture.asset(
                      MyImg.divider,
                      width: 120.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 90,
            color: Colors.white,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(MyImg.decrement),
                  TextStyleWidget(
                    title: '${1}',
                    size: 23,
                    color: MyColors.selectColors,
                    weight: FontWeight.w700,
                  ),
                  SvgPicture.asset(MyImg.increment),
                  GestureDetector(
                    onTap: () {
                      _showDialog(context);
                    },
                    child: Container(
                      width: 202,
                      height: 54,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: MyColors.selectColors,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(MyImg.shoppingCart),
                            TextStyleWidget(
                              title: 'Add to Cart',
                              size: 18,
                              weight: FontWeight.w700,
                              color: MyColors.whiteColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: MyColors.whiteColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.h),
                Container(
                  child: Image.asset(
                    "assets/images/dones.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                SizedBox(height: 10.h),
                const Text(
                  "Successful",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: MyColors.black),
                ),
                Text(
                  "Your Item is Successfully Added in ",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff4F4F4F),
                  ),
                ),
                Text(
                  "  your Card ",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff4F4F4F),
                  ),
                ),
                SizedBox(height: 20.h),
                ButtonWidget(
                    onPress: () {
                      Get.to(() => const HomeView());
                    },
                    title: "Continue  Shop",
                    buttonColor: MyColors.recolor,
                    textColor: MyColors.whiteColor,
                    buttonBorderColor: Colors.transparent),
                SizedBox(height: 10.h),
                ButtonWidget(
                    onPress: () {
                      Get.to(() => const CartView());
                    },
                    title: "View Cart",
                    buttonColor: Colors.transparent,
                    textColor: MyColors.recolor,
                    buttonBorderColor: MyColors.recolor),
                SizedBox(height: 10.h),
              ],
            ));
      },
    );
  }
}
