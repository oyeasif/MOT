import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mallturkeya/resp/colors/colors.dart';
import 'package:mallturkeya/resp/widget/category_widget.dart';
import 'package:mallturkeya/resp/widget/customrow_widget.dart';

import '../../../../resp/images/myimages.dart';

class HomeCategoriesWidget extends StatefulWidget {
  const HomeCategoriesWidget({super.key});

  @override
  State<HomeCategoriesWidget> createState() => _HomeCategoriesWidgetState();
}

class _HomeCategoriesWidgetState extends State<HomeCategoriesWidget> {
  List imgList2 = [
    {'id': 1, "image_paths": MyImg.sweet1, "title": "Turkish \n Delights"},
    {'id': 2, "image_paths": MyImg.sweet3, "title": "Coffee \n & Tea"},
    {'id': 3, "image_paths": MyImg.sweet2, "title": "Turkish \n Flavor"},
    {'id': 4, "image_paths": MyImg.sweet1, "title": "Turkish \n Delights"},
    {'id': 5, "image_paths": MyImg.sweet3, "title": "Coffee \n & Tea"},
    {'id': 6, "image_paths": MyImg.sweet2, "title": "Turkish \n Flavor"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400.h,
      color: MyColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          CustomRow(img: MyImg.arrow1, title: "Category"),
         GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: imgList2.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisExtent: 125, mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                return CategoryWidget(
                    img: imgList2[index]['image_paths'],
                    title: imgList2[index]['title']);
              })
        ],
      ),
    );
  }
}
