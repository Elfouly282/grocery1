import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/features/category/presentation/widgets/tabbarview_product.dart';

class Gridproduct extends StatelessWidget {
  const Gridproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 16,
        crossAxisCount: 2,
        childAspectRatio: .75,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: ColorManager.appbarBackground,
          borderRadius: BorderRadius.circular(13),
        ),

        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/Rectangle 19.png',

                    //  width: double.infinity,
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
                          color: const Color.fromARGB(255, 137, 132, 132),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text("Minced Meat "), Text("(8 Kg)")],
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
                          style: getRegularStyle(color: ColorManager.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: Sizes.s8.h),

                    Text(
                      '£130',
                      style: getMediumStyle(
                        fontSize: 16,
                        color: ColorManager.primary,
                      ),
                    ),
                    SizedBox(height: Sizes.s8.h),

                    SizedBox(
                      height: 31,

                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
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
  }
}
