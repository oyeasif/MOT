import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mallturkeya/resp/images/myimages.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int currentIndex = 0;
  List imgList = [
    {'id': 1, "image_path": MyImg.Banner},
    {'id': 2, "image_path": MyImg.Banner},
    {'id': 3, "image_path": MyImg.Banner},
  ];
  final CarouselController carousalController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                InkWell(
                  onTap: () {},
                  child: CarouselSlider(
                    items: imgList
                        .map((item) => ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                item["image_path"],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ))
                        .toList(),
                    carouselController: carousalController,
                    options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
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
                    left: 0,
                    right: 0,
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
                              width: currentIndex == entry.key ? 7 : 7,
                              height: 7.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: currentIndex == entry.key
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
