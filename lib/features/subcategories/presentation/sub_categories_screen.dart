import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/appassets.dart';
import 'package:grocery1/features/subcategories/presentation/widgets/categories_Item.dart';
import 'package:grocery1/features/subcategories/presentation/widgets/product_card.dart';
import '../../../../../core/di/servicelocator.dart';
import 'cubit/categories_view_model.dart';
import 'cubit/category_details_state.dart';
import 'cubit/category_details_view_model.dart';
import 'cubit/category_state.dart';
class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({super.key});
  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}
class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CategoriesViewModel>()..getCategories(),
        ),
        BlocProvider(
          create: (_) => getIt<CategoryDetailsViewModel>(),
        ),
      ],
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
            InkWell(child: Icon(Icons.shopping_cart_outlined, size: 24.sp),    onTap: () {},),
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
              final categoriesCubit = context.read<CategoriesViewModel>();
              final detailsCubit = context.read<CategoryDetailsViewModel>();
              final categories = state.response.data ?? [];

              if (categories.isEmpty) {
                return const Center(child: Text('No categories found'));
              }

              final selectedIndex =
              categoriesCubit.selectedIndex.clamp(0, categories.length - 1);
              final selectedCategory = categories[selectedIndex];

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
                    SizedBox(
                      height: 125.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final isSelected = index == categoriesCubit.selectedIndex;
                          return GestureDetector(
                            onTap: () {
                              categoriesCubit.changeIndex(index);
                              final id = categories[index].id;
                              if (id != null) {
                                detailsCubit.getCategoryDetails(id.toInt());
                              }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: CategoryItem(
                                color: isSelected
                                    ? ColorManager.primary
                                    : ColorManager.black,
                                backgroundColor: isSelected
                                    ? ColorManager.baseWhite
                                    : ColorManager.appbarBackground,
                                image: categories[index].imageUrl ?? "",
                                title: categories[index].name ?? "",
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 10.h),
                    Divider(color: Colors.grey.shade200),
                    SizedBox(height: 10.h),

                    Expanded(
                      child: BlocBuilder<CategoryDetailsViewModel, CategoryDetailsState>(
                        builder: (context, detailsState) {
                          if (detailsState is CategoryDetailsLoading) {
                            return const Center(child: CircularProgressIndicator());
                          }

                          if (detailsState is CategoryDetailsError) {
                            return Center(child: Text(detailsState.message));
                          }

                          if (detailsState is CategoryDetailsSuccess) {
                            final meals = detailsState.response.data?.meals ?? [];

                            if (meals.isEmpty) {
                              return const Center(child: Text('No products found'));
                            }

                            return ListView.builder(
                              itemCount: meals.length,
                              itemBuilder: (context, index) {
                                final meal = meals[index];
                                return GestureDetector(
                                  onTap:(){
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (_) => ProductDetailsScreen(meal: meal),
                                      //   ),
                                      // );

                                  },
                                  child: ProductCard(
                                    image: meal.imageUrl ?? AppAssets.rectangle19,
                                    title: meal.title ?? "",
                                    description: meal.description ?? "",
                                  ),
                                );
                              },
                            );
                          }

                          // Default: show selected category info before any tab is tapped
                          return ListView(
                            children: [
                              ProductCard(
                                image: selectedCategory.imageUrl ?? AppAssets.rectangle19,
                                title: selectedCategory.name ?? "",
                                description: selectedCategory.description ?? "",
                              ),
                            ],
                          );
                        },
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