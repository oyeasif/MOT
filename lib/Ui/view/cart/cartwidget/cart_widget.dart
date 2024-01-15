import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mallturkeya/resp/colors/colors.dart';

class CardItemWidget extends StatelessWidget {
  final String img;
  final String productname;
  final String color;
  final String size;
  final int quantity;
  final String date;
  final double price;
  final String deleteIconPath;

  const CardItemWidget({
    Key? key,
    required this.img,
    required this.productname,
    required this.color,
    required this.size,
    required this.quantity,
    required this.date,
    required this.price,
    required this.deleteIconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Container(
        width: 373,
        height: 113.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.08),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  width: 91,
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F2F2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(img),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productname,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            "Color :",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          Text(
                            " $color ",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13),
                          ),
                          const Text(
                            " Size:",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          Text(
                            " $size",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const Icon(
                            Icons.remove,
                            color: MyColors.grey5,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "$quantity",
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.add,
                            color: MyColors.grey5,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(deleteIconPath),
                      const SizedBox(height: 20),
                      const SizedBox(width: 10),
                      Text(
                        date,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Color(0xff9B9B9B),
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "\$$price",
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: MyColors.black,
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.02,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
