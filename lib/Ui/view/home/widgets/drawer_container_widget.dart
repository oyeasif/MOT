import 'package:flutter/material.dart';

class DrawerContainer extends StatefulWidget {
  String title;
  final icon;
  VoidCallback onpress = () {};
  DrawerContainer(
      {Key? key, required this.title, this.icon, required this.onpress})
      : super(key: key);

  @override
  State<DrawerContainer> createState() => _DrawerContainerState();
}

class _DrawerContainerState extends State<DrawerContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title),
          InkWell(
            child: Icon(widget.icon),
            onTap: widget.onpress,
          ),
        ],
      ),
    );
  }
}
