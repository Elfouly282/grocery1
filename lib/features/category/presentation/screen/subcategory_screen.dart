import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/features/category/presentation/widgets/gridview.dart';
import 'package:grocery1/features/category/presentation/widgets/tabbarview_product.dart';

class ProductList extends StatefulWidget {
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int initindex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new),
        backgroundColor: ColorManager.appbarBackground,
        toolbarHeight: Sizes.s100.h,
        actions: [
          Icon(
            CupertinoIcons.search,
            size: Sizes.s28.w,
            color: ColorManager.primary,
          ),
          SizedBox(width: Sizes.s18.w),
          Icon(
            Icons.shopping_cart_outlined,
            size: Sizes.s28.w,
            color: ColorManager.black,
          ),
          SizedBox(width: Sizes.s10.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.s24.w,
          vertical: Sizes.s24.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sub Categories",
              style: getMediumStyle(color: Colors.black, fontSize: 16.sp),
            ),
            SizedBox(height: Sizes.s16.h),

            TabbarviewProduct(),

            SizedBox(height: Sizes.s20.h),
            Expanded(flex: 4, child: Gridproduct()),
          ],
        ),
      ),
    );
  }
}
