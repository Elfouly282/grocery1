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

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CategoriesViewModel>()..getCategories(),
      child: Scaffold(
        backgroundColor: ColorManager.appbarBackground,
        appBar: AppBar(
          backgroundColor: ColorManager.baseWhite,
          elevation: 0,
          leading: Icon(Icons.arrow_back_ios, size: 24.sp),
          actions: [
            InkWell(
              onTap: () {},
              child: Image.asset(AppAssets.search, width: 22.w, height: 22.h),
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
              final cubit = context.read<CategoriesViewModel>();
              final categories = state.response.data ?? [];
              final selectedCategory = categories[cubit.selectedIndex];

              return Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    /// 🔹 Horizontal image card tabs
                    SizedBox(
                      height: 125.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final isSelected = index == cubit.selectedIndex;
                          return GestureDetector(
                            onTap: () => cubit.changeIndex(index),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: CategoryItem(
color:isSelected?ColorManager.primary:ColorManager.black ,
                                backgroundColor: isSelected?ColorManager.baseWhite:ColorManager.appbarBackground,
                                image: categories[index].imageUrl ?? "",
                                title: categories[index].name ?? "",
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 10.h),
                    Divider(height: 1, color: Colors.grey.shade200),
                    SizedBox(height: 10.h),

                    /// 🔹 Products — update when tab changes
                    Expanded(
                      child: ListView(
                        children: [
                          ProductCard(
                            image: selectedCategory.imageUrl ??
                                AppAssets.rectangle19,
                            title: selectedCategory.name ?? "",
                            description: selectedCategory.description ?? "",
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