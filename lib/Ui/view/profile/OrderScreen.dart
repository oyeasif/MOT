import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mallturkeya/Ui/view/profile/Orders/AllOrders.dart';
import 'package:mallturkeya/Ui/view/profile/Orders/Cancelled.dart';
import 'package:mallturkeya/Ui/view/profile/Orders/Completed.dart';
import 'package:mallturkeya/Ui/view/profile/Orders/Pending.dart';
import '../../../resp/colors/colors.dart';
import '../../../resp/images/myimages.dart';
import '../../../resp/widget/country-codes.dart';
import '../../../resp/widget/custom_text.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Map<String, String>? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.backGroundColor,
        extendBody: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: MyColors.backGroundColor,
          toolbarHeight: 32.h,
          actions: [

            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Map<String, String>>(
                  isExpanded: true,
                  style: const TextStyle(fontSize: 17, color: Colors.black),
                  hint: CustomText(value: 'Urdu'.tr, color: Colors.grey[700]),
                  icon: Row(
                    children: [
                      if (selectedCountry != null)
                        Image.asset(
                          'assets/icons/countries/${selectedCountry!['code']!.toLowerCase()}.png',
                          width: 24,
                          height: 24,
                        ),
                      const SizedBox(width: 8),
                      SvgPicture.asset("assets/icons/polygon.svg"),
                      SizedBox(width: 8.w),
                    ],
                  ),
                  value: selectedCountry,
                  items:
                      codes.map<DropdownMenuItem<Map<String, String>>>((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Row(
                        children: [
                          SizedBox(width: 8.w),
                          Text(item['name'] ?? '',
                              style: const TextStyle(fontSize: 20)),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedCountry = val;
                    });
                  },
                ),
              ),
            ),
          ],
          bottom: AppBar(
            toolbarHeight: 56.h,
            backgroundColor: Colors.white,
            elevation: 2,
            title: SvgPicture.asset(
              MyImg.logo,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(MyImg.Searchicon),
              ),
              Badge(
                label: const Text('2'),
                backgroundColor: Colors.red,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(MyImg.carticon),
                ),
              ),
              SizedBox(width: 10.w),
            ],
          ),
        ),
        body: const DefaultTabController(
          length: 4, // Number of tabs
          child: Column(
            children: [
              TabBar(
                padding: EdgeInsets.zero,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                indicatorColor: MyColors.selectColors,
                labelColor: MyColors.selectColors,
                labelStyle: TextStyle(
                  color: MyColors.selectColors,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0.12,
                ),
                tabs: [
                  Tab(text: 'All Orders'),
                  Tab(text: 'Pending'),
                  Tab(text: 'Completed'),
                  Tab(text: 'Canceled'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    AllOrders(),
                    Pending(),
                    Completed(),
                    Cancelled(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
