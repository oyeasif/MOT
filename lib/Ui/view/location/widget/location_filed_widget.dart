import 'package:flutter/material.dart';

class LocationTextFieldWidget extends StatelessWidget {
  final String hint;
  final IconData? icon;
  final double width;

  const LocationTextFieldWidget({
    Key? key,
    required this.hint,
    this.icon,
    this.width = 375.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 4),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Color(0xffD3DAF0),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon),
              ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10),

                  hintText: hint,
                  helperStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: Color(0xff333),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
