import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/values_manager.dart';

class TabbarviewProduct extends StatelessWidget {
  const TabbarviewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return    Expanded(
              flex: 1,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: Sizes.s8.w),

                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: ColorManager.appbarBackground,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  width: Sizes.s80.w,
                  height: Sizes.s120.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: Image.asset(
                          fit: BoxFit.cover,
                          'assets/images/Frame 631.png',
                        ),
                      ),
                      SizedBox(height: 6,),
                      Text(
                        textAlign: TextAlign.center,
                        '''Beef & Lamsd''', maxLines: 2),
                    ],
                  ),
                ),
              ),
            );
  }
}