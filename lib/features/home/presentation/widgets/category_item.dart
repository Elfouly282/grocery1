import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../domain/entity/category_section_entity.dart';

class CategoryItem extends StatelessWidget {
  final CategorySectionEntity category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          Container(
            width: 80.w,
            height: 122.h,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: ColorManager.grey,
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                category.imageUrl != null
                    ? Image.network(
                  category.imageUrl!,
                  width: 60.w,
                  height: 50.h,
                  fit: BoxFit.contain,
                )
                    : Icon(Icons.category, size: 40.w),
                SizedBox(height: 6.h),
                Text(
                  category.name,
                  style: getRegularStyle(color: ColorManager.black, fontSize: 14.sp),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}