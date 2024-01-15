import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors/colors.dart';
import '../images/myimages.dart';
import 'TextWidget.dart';

class AccountListTile extends StatelessWidget {
  String title;
  VoidCallback onPress = (){};
  AccountListTile({Key? key, required this.title, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(10),
        width: 392,
        height: 58,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextStyleWidget(title: title, size: 16, weight: FontWeight.w500,color: MyColors.black,),
            SvgPicture.asset(MyImg.arrowForward),
          ],
        ),
      ),
    );
  }
}
