import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:grocery1/core/utils/app_text.dart';

import '../../domain/entity/meal_entity.dart';

class TodayDealsBanner extends StatelessWidget {
  final List<MealEntity> deals;

  const TodayDealsBanner({super.key, required this.deals});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.todaysDeals(),
        SizedBox(height: 12.h),

        CarouselSlider(
          options: CarouselOptions(
            height: 142.h,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.85,
          ),

          items: deals.map((meal) {
            return Builder(
              builder: (context) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                      image: NetworkImage(meal.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        meal.title,
                        style: getMediumStyle(
                          color: ColorManager.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),

        SizedBox(height: 12.h),
      ],
    );
  }
}
