import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';

class CategoriesSection extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  const CategoriesSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Categories',
            style:getMediumStyle(color: ColorManager.black,fontSize: 16.sp)
    ),
         SizedBox(height: 8.h),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) =>
                _CategoryItem(category: categories[index]),
          ),
        ),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final Map<String, dynamic> category;
  const _CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child:
      Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 80.w,
                height: 122.h,
                decoration: BoxDecoration(
                  color: ColorManager.lightGrey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      category['icon'] as String,
                      style: const TextStyle(fontSize: 30),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      category['label'] as String,
                      style:getRegularStyle(color: ColorManager.black,fontSize: 14.sp),

                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}