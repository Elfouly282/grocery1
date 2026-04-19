import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/features/category/presentation/cubit/subcategories_cubit.dart';

class Gridproduct extends StatefulWidget {
  @override
  State<Gridproduct> createState() => _GridproductState();
}

class _GridproductState extends State<Gridproduct> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubcategoriesCubit, Subcategories>(
      builder: (context, state) {
        if (state.productsLoading) {
          return Center(
            child: CircularProgressIndicator(color: ColorManager.primary),
          );
        } else if (state.products.isNotEmpty) {
          return GridView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: state.products.length,
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
                        Image.network(
                          //    height: 120.h,
                          fit: BoxFit.fill,
                          state.products[index].imageurl!,
                          width: double.infinity,
                        ),
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
                                color: state.products[index].isfeatured
                                    ? Colors.red
                                    : ColorManager.grey,
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
                            children: [
                              Expanded(
                                child: Text(
                                  maxLines: 1,
                                  state.products[index].title,
                                ),
                              ),
                              //    Expanded(child: Text("(8 Kg)")),
                            ],
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

                          Row(
                            children: [
                              Text(
                                '£${state.products[index].finalprice}',
                                maxLines: 1,
                                style: getMediumStyle(
                                  fontSize: 16,
                                  color: ColorManager.primary,
                                ),
                              ),
                              SizedBox(width: Sizes.s10.w),
                              Text(
                                '£${state.products[index].price}',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorManager.grey,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: ColorManager.grey,
                                ),
                              ),
                            ],
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
        } else if (state.error != null) {
          return Center(child: Text(state.error ?? 'Not founded data'));
        }
        return Center(child: SizedBox(child: Text('No meals yet')));
      },
    );
  }
}
