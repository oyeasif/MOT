import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String logoImagePath;
  final String searchIconPath;
  final VoidCallback onp1;
  final String cartIconPath;

  final VoidCallback onp2;
  final int cartBadgeCount;

  CustomAppBarWidget({
    required this.logoImagePath,
    required this.searchIconPath,
    required this.cartIconPath,
    this.cartBadgeCount = 0,
    required this.onp1,
    required this.onp2,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      automaticallyImplyLeading: false,
      shadowColor: Colors.white,
      title: logoImagePath.isNotEmpty
          ? SvgPicture.asset(
              logoImagePath,
              width: 40,
              height: 40,
            )
          : SizedBox(), // Optional logo
      actions: [
        searchIconPath.isNotEmpty
            ? IconButton(
                onPressed: onp1,
                icon: SvgPicture.asset(searchIconPath),
              )
            : SizedBox(), // Optional search icon
        cartIconPath.isNotEmpty
            ? Badge(
                label: Text(cartBadgeCount.toString()),
                backgroundColor: Colors.red,
                child: IconButton(
                  onPressed: onp2,
                  icon: SvgPicture.asset(cartIconPath),
                ),
              )
            : SizedBox(), // Optional cart icon
        SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
