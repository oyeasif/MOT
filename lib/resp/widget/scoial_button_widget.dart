import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocailButtonWidget extends StatelessWidget {
  final String img;
  final VoidCallback onPressed;
  final Color backgroundColor;

  SocailButtonWidget({
    required this.img,
    required this.onPressed,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      // ignore: sort_child_properties_last
      child: Image.asset(
        img,
        color: Colors.white,
        width: 30.0,
        height: 30.0,
      ),
      backgroundColor: backgroundColor,
      shape: const CircleBorder(),
    );
  }
}
