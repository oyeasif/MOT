import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mallturkeya/resp/colors/colors.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String defaultvalue = '';
  List dropdownData = [
    {"title": "Free Shipping Offers", "value": "1"},
    {"title": "Home Fragrances", "value": "2"},
    {"title": "Stationery", "value": "3"},
    {"title": "Tonics", "value": "4"},
    {"title": "Turkish Attar", "value": "5"},
    {"title": "Turkish Dinner sets", "value": "6"},
    {"title": "Coffee & Tea", "value": "7"},
    {"title": "Coffee & Tea sets", "value": "8"},
    {"title": "Free Shipping Offers", "value": "9"},
    {"title": "Home Fragrances", "value": "10"},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
            color: Colors.white,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                dropdownColor: Colors.white,
                value: defaultvalue,
                isExpanded: true,
                menuMaxHeight: 350,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/icons/dropdownicons.svg",
                   color: MyColors.black,
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    child: Row(
                      children: [
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/icons/categoyicon.svg"),
                        SizedBox(width: 5.w),
                        const Text(
                          "Category",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    value: "",
                  ),
                  ...dropdownData
                      .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                e['title'],
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            value: e['value'],
                          ))
                      .toList(),
                ],
                onChanged: (value) {
                  setState(() {
                    defaultvalue = value!;
                  });
                },
              ),
            ),
          );
  }
}