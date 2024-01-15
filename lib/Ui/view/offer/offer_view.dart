import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mallturkeya/resp/images/myimages.dart';

class OfferView extends StatefulWidget {
  const OfferView({super.key});

  @override
  State<OfferView> createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
  List imgList = [
    {'id': 1, "image_path": MyImg.offer1, "title": "Flash Deals"},
    {'id': 2, "image_path": MyImg.offer2, "title": "Coupons"},
    {'id': 3, "image_path": MyImg.offer3, "title": "Coupons"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: imgList.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 200,
                    child: Image.asset(
                      imgList[index]['image_path'],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 164,
                  left: 19,
                  child: Row(
                    children: [
                      Text(
                        imgList[index]['title'], // Use dynamic title
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          "assets/images/arrow.png",
                          color: Colors.white,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
