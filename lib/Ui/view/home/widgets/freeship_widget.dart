import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mallturkeya/resp/colors/colors.dart';
import 'package:mallturkeya/resp/widget/rating_widget.dart';

class FreeShipCardWidget extends StatelessWidget {
  final String img;
  final String title;
  final String title2;
  final String newprice;
  final String oldprice;
  const FreeShipCardWidget(
      {super.key,
      required this.img,
      required this.title,
      required this.title2,
      required this.newprice,
      required this.oldprice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Container(
        width: 170,
        height: 320,
        child: Padding(
          padding: const EdgeInsets.only(left: 4, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.asset(
                      img,
                      width: 160,
                      height: 180,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 4,
                    left: 9,
                    child: Container(
                        alignment: Alignment.center,
                        width: 68,
                        height: 22.h,
                        decoration: BoxDecoration(
                            color: MyColors.orangeColor,
                            borderRadius: BorderRadius.circular(7)),
                        child: const Text(
                          "Free shipping",
                          style: TextStyle(fontSize: 9),
                        )),
                  ),
                  Positioned(
                    top: 3,
                    left: 104,
                    child: Container(
                      width: 30,
                      height: 22,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.favorite_outline_outlined,
                        color: Colors.red,
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 4.h),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Text(
                  title2,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "In Stock",
                      style: TextStyle(
                        color: MyColors.greencolor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      newprice,
                      style: const TextStyle(color: Colors.orange),
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomRatingBar(
                      starCount: 5,
                      rating: 3.5,
                      size: 14.0,
                      onRatingChanged: (rating) {
                        print('New Rating: $rating');
                      },
                    ),
                    Text(
                      oldprice,
                      style: const TextStyle(
                          color: MyColors.grey5,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
