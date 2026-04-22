import 'package:flutter/material.dart';

import 'package:grocery1/core/resources/color_manager.dart';

import '../../../../core/resources/appassets.dart';
import '../widgets/categories_section.dart';
import '../widgets/home_bottom_nav.dart';
import '../widgets/home_header.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/recommended_section.dart';
import '../widgets/todays_deals_banner.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {'icon': '🥩', 'label': 'Meat,\nPoultry, &\nSeafood'},
    {'icon': '🥕', 'label': 'Fresh\nProduce'},
    {'icon': '🧀', 'label': 'Dairy &\nEggs'},
    {'icon': '🍞', 'label': 'Bakery &\nBread'},
    {'icon': '🥶', 'label': 'Frozen\nFoods'},
  ];
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Orange',
      'weight': '500gm',
      'price': 20.0,
      'oldPrice': null,
      'rating': 4.0,
      'reviews': 4,
      'image': AppAssets.orange, // ← بدل 'emoji'
      'color': Color(0xFFFFFFFF),
    },
    {
      'name': 'Kiwi',
      'weight': '500gm',
      'price': 40.0,
      'oldPrice': 45.0,
      'rating': 4.0,
      'reviews': 4,
      'image': AppAssets.orange, // ← بدل 'emoji'
      'color': const Color(0xFFFFFFFF),
    },


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const HomeHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HomeSearchBar(),
                      const TodaysDealsBanner(),
                      CategoriesSection(categories: categories),
                      RecommendedSection(products: products),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}