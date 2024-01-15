// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mallturkeya/resp/widget/dropdown_widget.dart';

import '../../../resp/colors/colors.dart';
import '../../../resp/images/myimages.dart';
import '../../../resp/widget/category_card_widget.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  String? selectedOption;

  List imgList = [
    {
      'id': 1,
      "image_path": MyImg.product1,
    },
    {
      'id': 2,
      "image_path": MyImg.product2,
    },
    {
      'id': 1,
      "image_path": MyImg.product1,
    },
    {
      'id': 2,
      "image_path": MyImg.product2,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.greyligth,
      body: ListView(
        children: [
          ////// Dropdown button
          // ignore: prefer_const_constructors
          DropDownWidget(),
          SizedBox(height: 10.h),

          ////// Banner ///////////////////////////
          Container(
            width: double.infinity,
            height: 200.h,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/c1.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),

          ///////// Products ///////////////////////

          Container(
            width: double.infinity,
            height: 600.h,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                const Padding(
                  padding: EdgeInsets.only(left: 14, right: 21),
                  child: Text(
                    "Cosmetics Product",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 8.h),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 1.0,
                    mainAxisExtent: 280.h,
                  ),
                  itemCount: imgList.length,
                  itemBuilder: (context, index) {
                    return CategoryCardWidget(
                      onpressed: (){},
                      img: imgList[index]['image_path'],
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
    );
  }
}
