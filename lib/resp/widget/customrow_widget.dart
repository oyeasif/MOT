import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mallturkeya/resp/colors/colors.dart';
import 'package:mallturkeya/resp/images/myimages.dart';

class CustomRow extends StatelessWidget {
  final String img;
  final String title;
  const CustomRow({super.key, required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: MyColors.grey1,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          SvgPicture.asset(
            img,
            width: 18,
            height: 18,
          ),
        ],
      ),
    );
  }
}
