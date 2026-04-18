import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/features/category/presentation/cubit/subcategories_cubit.dart';

class Gridproduct extends StatefulWidget {
  int categoryid;
  Gridproduct({required this.categoryid});

  @override
  State<Gridproduct> createState() => _GridproductState();
}

class _GridproductState extends State<Gridproduct> {
  @override
  void initState() {
    super.initState();
    context.read<SubcategoriesCubit>().fetchSubCategoryDetails(
      5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubcategoriesCubit, SubcategoriesState>(
      builder: (context, state) {
        if (state is SubcategoriesDetailsLoading) {
          return Center(
            child: CircularProgressIndicator(color: ColorManager.primary),
          );
        } else if (state is SubcategoriesDetailsLoaded) {
          return GridView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: state.subcategorydetailslist.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 16,
              crossAxisCount: 2,
              childAspectRatio: .75,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                border: Border.all(width: .5, color: ColorManager.grey),
                color: ColorManager.appbarBackground,
                borderRadius: BorderRadius.circular(12.r),
              ),

              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        // Image.asset(
                        //   state.subcategorydetailslist[index].imageurl!,
                        //   //     width: double.infinity,
                        // ),
                        Positioned(
                          top: 4.h,
                          left: 142.w,
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(13.r),
                            child: Container(
                              height: 23.h,
                              width: 23.w,
                              color: Colors.white,
                              child: Icon(
                                size: 16.sp,
                                Icons.favorite_sharp,
                                color: state.subcategorydetailslist[index].isfeatured ? Colors.red :ColorManager.grey ,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [Text(state.subcategorydetailslist[index].title), Text("(8 Kg)")],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 17),
                              Icon(Icons.star, color: Colors.amber, size: 17),
                              Icon(Icons.star, color: Colors.amber, size: 17),
                              Icon(Icons.star, color: Colors.amber, size: 17),
                              Icon(Icons.star, color: Colors.amber, size: 17),
                              Text(
                                '(5)',
                                style: getRegularStyle(
                                  color: ColorManager.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Sizes.s8.h),

                          Text(
                            '${state.subcategorydetailslist[index].price}',
                            style: getMediumStyle(
                              fontSize: 16,
                              color: ColorManager.primary,
                            ),
                          ),
                          SizedBox(height: Sizes.s8.h),

                          SizedBox(
                            height: 31.h,

                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                backgroundColor: ColorManager.primary,
                              ),
                              onPressed: () {},
                              child: Text(
                                "Add to Cart",
                                style: getMediumStyle(
                                  fontSize: 16,
                                  color: ColorManager.appbarBackground,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is SubcategoriesDetailsError) {
          return Center(child: Text(state.message));
        }
        return SizedBox(child: Text('null'));
      },
    );
  }
}
