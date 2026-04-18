import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/features/category/presentation/cubit/subcategories_cubit.dart';

class TabbarviewProduct extends StatefulWidget {

  TabbarviewProduct({
    required this.selectedcategory,
    super.key,
  });
  final void Function(int x) selectedcategory;

  @override
  State<TabbarviewProduct> createState() => _TabbarviewProductState();
}

class _TabbarviewProductState extends State<TabbarviewProduct> {
  int toggle = 0;
  @override
  void initState() {
    super.initState();
    context.read<SubcategoriesCubit>().fetchSubCategory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubcategoriesCubit, SubcategoriesState>(
      builder: (context, state) {
        if (state is SubcategoriesLoading) {
          return CircularProgressIndicator(color: Colors.amber);
        } else if (state is SubcategoriesLoaded) {
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
                  widget.selectedcategory(index);
                  context.read<SubcategoriesCubit>().fetchSubCategoryDetails(index+1);
                 // widget.indexselected = index;
                  toggle = index;
                  setState(() {
                    print('toggle is  $toggle');
                
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                  
                    border: Border.all(width: .8.w, color: ColorManager.grey),
                    color:  toggle == index
                        ? Colors.white
                        : const Color.fromARGB(255, 244, 246, 246),
                    borderRadius: BorderRadius.circular(16.r),
                  ),

                  width: Sizes.s80.w,
                  height: Sizes.s100.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Image.asset(
                          fit: BoxFit.cover,
                          "assets/images/Frame 631.png",
                        ),
                      ),
                      SizedBox(height: 6.h),
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
        } else if (state is SubcategoriesError) {
          return Text(state.message);
        }
        return SizedBox(child: Text("null"));
      },
    );
  }
}
