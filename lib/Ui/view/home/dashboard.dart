// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mallturkeya/Ui/view/cart/cart_view.dart';
import 'package:mallturkeya/Ui/view/home/widgets/drawer_container_widget.dart';
import 'package:mallturkeya/animation/auto_shake_animation.dart';
import 'package:mallturkeya/resp/colors/colors.dart';
import 'package:mallturkeya/resp/images/myimages.dart';
import 'package:mallturkeya/Ui/view/category/category_view.dart';
import 'package:mallturkeya/Ui/view/home/home_view.dart';
import 'package:mallturkeya/Ui/view/offer/offer_view.dart';
import 'package:mallturkeya/Ui/view/profile/profile_view.dart';
import 'package:mallturkeya/resp/widget/country-codes.dart';
import 'package:mallturkeya/resp/widget/custom_text.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  Map<String, String>? selectedCountry;

  bool isVisible = false;
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeView(),
    CategoriesView(),
    OfferView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffF2F2F2),
        toolbarHeight: 32.h,
        actions: [
          Text("Free Shipping Ends"),
          SizedBox(
            width: 120.w,
          ),
          Icon(Icons.close),
          SizedBox(
            width: 40.w,
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
              label: Text('0'),
              backgroundColor: Colors.red,
              child: IconButton(
                onPressed: () {
                  Get.to(() => CartView());
                },
                icon: SvgPicture.asset(MyImg.carticon),
              ),
            ),
            SizedBox(width: 10.w),
          ],
        ),
      ),
      drawer: Drawer(
        clipBehavior: Clip.none,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.cancel_outlined)),
                  const SizedBox(
                    width: 30,
                  ),
                  SvgPicture.asset(MyImg.logo),
                ],
              ),
            ),
            DrawerContainer(
              title: 'Home Fragrances',
              onpress: () {},
            ),
            const SizedBox(
              height: 3,
            ),
            DrawerContainer(
              title: 'Stationary',
              onpress: () {},
            ),
            const SizedBox(
              height: 3,
            ),
            DrawerContainer(
              title: 'Supplementary and vitamins',
              icon: isVisible
                  ? Icons.arrow_drop_up_outlined
                  : Icons.arrow_drop_down_outlined,
              onpress: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
            ),
            const SizedBox(
              height: 3,
            ),
            if (isVisible)
              Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                padding: const EdgeInsets.all(15),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Children\'s Multivitamins'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Diet, Health & Sports'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Multivitamins and Supplements'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Show all supplementary & Vitamins'),
                    ],
                  ),
                ),
              ),
            const SizedBox(
              height: 3,
            ),
            DrawerContainer(
              title: 'Tonics',
              onpress: () {},
            ),
            const SizedBox(
              height: 3,
            ),
            DrawerContainer(
              title: 'Cosmetics',
              icon: Icons.arrow_drop_down_outlined,
              onpress: () {},
            ),
            const SizedBox(
              height: 3,
            ),
            DrawerContainer(
              title: 'Turkish delights',
              onpress: () {},
            ),
            const SizedBox(
              height: 3,
            ),
            DrawerContainer(
              title: 'Coffee & tea',
              onpress: () {},
            ),
            const SizedBox(
              height: 3,
            ),
            DrawerContainer(
              title: 'Coffee and tea sets',
              onpress: () {},
            ),
            const SizedBox(
              height: 3,
            ),
            DrawerContainer(
              title: 'Turkish snacks and chocolate',
              onpress: () {},
            ),
            const SizedBox(
              height: 3,
            ),
            DrawerContainer(
              title: 'Winter collection',
              icon: Icons.arrow_drop_down_outlined,
              onpress: () {},
            ),
            const SizedBox(
              height: 3,
            ),
            DrawerContainer(
              title: 'Turkish flavor',
              onpress: () {},
            ),
            const SizedBox(
              height: 3,
            ),
            DrawerContainer(
              title: 'Tasbeeh and rings',
              onpress: () {},
            ),
            const SizedBox(
              height: 3,
            ),
            DrawerContainer(
              title: 'Home and lifestyle',
              onpress: () {},
            ),
            const SizedBox(
              height: 3,
            ),
            DrawerContainer(
              title: 'Blog',
              onpress: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.all(12.0).copyWith(left: 0, right: 0, bottom: 0),
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.green,
              offset: Offset(
                8.0,
                8.0,
              ),
              blurRadius: 4.0,
              spreadRadius: 4.0,
            )
          ]),
          child: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: MyColors.selectColors,
            unselectedItemColor: MyColors.unslectColors,
            backgroundColor: Colors.white,
            elevation: 0,
            iconSize: 24.sp,
            currentIndex: _currentIndex,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: SvgPicture.asset(
                    MyImg.homeoutline,
                  ),
                ),
                label: 'Home',
                activeIcon: CustomShakeAnimation(
                  begin: '-5.0',
                  end: '5.0',
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: SvgPicture.asset(
                      MyImg.home,
                      color: MyColors.selectColors,
                    ),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: SvgPicture.asset(
                    MyImg.categoryoutline,
                  ),
                ),
                label: 'Categories',
                activeIcon: CustomShakeAnimation(
                  begin: '-5.0',
                  end: '5.0',
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 22,
                        ),
                      )),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: SvgPicture.asset(
                    MyImg.offeroutline,
                    //color: MyColors.buttonTextColor,
                  ),
                ),
                label: 'Offers',
                activeIcon: CustomShakeAnimation(
                  begin: '-5.0',
                  end: '5.0',
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: SvgPicture.asset(
                      MyImg.offer,
                      color: MyColors.selectColors,
                    ),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: SvgPicture.asset(
                    MyImg.profileoutline,
                    //  color: MyColors.buttonTextColor,
                  ),
                ),
                label: 'Profile',
                activeIcon: CustomShakeAnimation(
                  begin: '-5.0',
                  end: '5.0',
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: SvgPicture.asset(
                      MyImg.profile,
                      color: MyColors.selectColors,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
