import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mallturkeya/resp/colors/colors.dart';
import 'package:mallturkeya/resp/widget/rating_widget.dart';

class CategoryCardWidget extends StatefulWidget {
  final String img;

  final VoidCallback onpressed;
  final String title;
  final String title2;
  final String newprice;
  final String oldprice;
  const CategoryCardWidget(
      {super.key,
      required this.img,
      required this.title,
      required this.title2,
      required this.newprice,
      required this.oldprice,
      required this.onpressed});

  @override
  State<CategoryCardWidget> createState() => _CategoryCardWidgetState();
}

class _CategoryCardWidgetState extends State<CategoryCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: SizedBox(
        width: 200,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: widget.onpressed,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        widget.img,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 120,
                    right: 10,
                    child: Container(
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
                  )
                ],
              ),
              SizedBox(height: 4.h),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Text(
                  widget.title,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Text(
                  widget.title2,
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
                      widget.newprice,
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
                      widget.oldprice,
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
