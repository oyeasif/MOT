import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mallturkeya/Ui/view/home/ProductDetail.dart';
import 'package:mallturkeya/resp/images/myimages.dart';
import 'package:mallturkeya/resp/widget/category_card_widget.dart';
import 'package:mallturkeya/resp/widget/countdown_widget.dart';
import 'package:mallturkeya/resp/widget/customrow_widget.dart';

import '../../../../resp/colors/colors.dart';

class FlashDealWidget extends StatefulWidget {
  const FlashDealWidget({super.key});

  @override
  State<FlashDealWidget> createState() => _FlashDealWidgetState();
}

class _FlashDealWidgetState extends State<FlashDealWidget> {
  List imgList4 = [
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
    return Container(
      width: double.infinity,
      height: 400,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomRow(img: MyImg.arrowForward, title: 'Flash Deals'),
              Row(
                children: [
                  const Text(
                    "Ends in",
                    style: TextStyle(color: MyColors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: CountdownWidget(),
                  ),
                ],
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: imgList4.map((item) {
                  return CategoryCardWidget(
                    onpressed: () {
                      Get.to(()=>ViewItem());
                    },
                    img: item['image_path'],
                    title: "Arifoglu Natural Active",
                    title2: "Carbon Soap 125g",
                    newprice: "\$${68.00}",
                    oldprice: "\$${70.0}",
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
