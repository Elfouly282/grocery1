import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/features/productslist/presentation/cubit/subcategories_cubit.dart';
import 'package:grocery1/features/productslist/presentation/widgets/shimmer_tabbar.dart';

class TabbarviewProduct extends StatefulWidget {
  @override
  State<TabbarviewProduct> createState() => _TabbarviewProductState();
}

class _TabbarviewProductState extends State<TabbarviewProduct> {
  @override
  void initState() {
    super.initState();
    context.read<SubcategoriesCubit>().fetchSubCategory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubcategoriesCubit, Subcategories>(
      builder: (context, state) {
        if (state.categoriesLoading) {
          return ShimmerCategories();
        } else if (state.subcategories.isNotEmpty) {
          return Expanded(
            flex: 1,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: Sizes.s8.w),

              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.subcategories.length,
              itemBuilder: (context, index) => InkWell(
                borderRadius: BorderRadius.circular(16.r),
                onTap: () {
                  context.read<SubcategoriesCubit>().selectCategory(
                    state.subcategories[index].id,
                  );

                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: .8.w, color: ColorManager.grey),
                    color:
                        state.selectedCategoryId ==
                            state.subcategories[index].id
                        ? ColorManager.appbarBackground
                        : const Color.fromARGB(255, 246, 247, 247),
                    borderRadius: BorderRadius.circular(16.r),
                  ),

                  width: Sizes.s80.w,
                  height: Sizes.s100.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // image
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Image.asset(
                          fit: BoxFit.cover,
                          "assets/images/Frame 631.png",
                        ),
                      ),
                      SizedBox(height: 6.h),
                      // Name subcategory
                      Text(
                        textAlign: TextAlign.center,
                        state.subcategories[index].name,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state.error != null) {
          return Text(state.error ?? "Not data founded");
        }
        return Center(child: SizedBox(child: Text("No data founded")));
      },
    );
  }
}
