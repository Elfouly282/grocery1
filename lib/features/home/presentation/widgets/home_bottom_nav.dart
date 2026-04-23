import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:grocery1/core/resources/color_manager.dart';

class HomeBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  const HomeBottomNav({super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: selectedIndex,
      height: 51,
      color: ColorManager.white,
      buttonBackgroundColor: ColorManager.primary,
      backgroundColor: ColorManager.white,
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.easeInOut,
      onTap: onItemTapped,
      items: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home_rounded, size: 26, color: selectedIndex == 0 ? ColorManager.white : ColorManager.black),
            if (selectedIndex != 0)
              Text('Home', style: TextStyle(fontSize: 10, color: ColorManager.black)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.list_alt_rounded, size: 26, color: selectedIndex == 1 ? ColorManager.white : ColorManager.black),
            if (selectedIndex != 1)
              Text('My List', style: TextStyle(fontSize: 10, color: ColorManager.black)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_outlined, size: 26, color: selectedIndex == 2 ? ColorManager.white : ColorManager.black),
            if (selectedIndex != 2)
              Text('My Order', style: TextStyle(fontSize: 10, color: ColorManager.black)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_outline_rounded, size: 26, color: selectedIndex == 3 ? ColorManager.white : ColorManager.black),
            if (selectedIndex != 3)
              Text('Profile', style: TextStyle(fontSize: 10, color: ColorManager.black)),
          ],
        ),
      ],
    );
  }}