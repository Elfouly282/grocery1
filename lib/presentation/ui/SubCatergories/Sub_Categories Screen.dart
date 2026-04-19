import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/appassets.dart';
import 'package:grocery1/core/di/servicelocator.dart';

import 'package:grocery1/presentation/ui/SubCatergories/Cubit/Categories_View_Model.dart';
import 'package:grocery1/presentation/ui/SubCatergories/Cubit/categories_state.dart';

import 'package:grocery1/presentation/ui/SubCatergories/widgets/CategoriesItem.dart';
import 'package:grocery1/presentation/ui/SubCatergories/widgets/ProductCard.dart';

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({super.key});

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CategoriesViewModel>()..getCategories(),
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.baseWhite,
          elevation: 0,
          leading: Icon(Icons.arrow_back_ios, size: 24.sp),
          actions: [
            InkWell(
              onTap: () {},
              child: Image.asset(
                AppAssets.search,
                width: 22.w,
                height: 22.h,
              ),
            ),
            SizedBox(width: 18.w),
            Icon(Icons.shopping_cart_outlined, size: 24.sp),
            SizedBox(width: 18.w),
          ],
        ),
        body: BlocBuilder<CategoriesViewModel, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CategoryError) {
              return Center(child: Text(state.message));
            }

            if (state is CategorySuccess) {
              final categories = state.response.data ?? [];

              return Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 Title
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    /// 🔹 Horizontal Categories (DYNAMIC)
                    SizedBox(
                      height: 157.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];

                          return CategoryItem(
                            image: category.imageUrl ??'',
                            title: category.name,
                          );
                        },
                      ),
                    ),

                    /// 🔹 Products (still static for now)
                    Expanded(
                      child: ListView(
                        children: [
                          ProductCard(
                            image: AppAssets.rectangle19,
                            title: "Beef & Lamb",
                            description:
                            "A variety of fresh red meats, including steak, and lamb pieces.",
                          ),
                          ProductCard(
                            image: AppAssets.rectangle19,
                            title: "Poultry",
                            description:
                            "Whole chickens, boneless breasts, wings, and other poultry parts ready for cooking.",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}