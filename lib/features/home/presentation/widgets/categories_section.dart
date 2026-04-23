import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grocery1/core/utils/app_text.dart';

import '../../domain/entity/category_section_entity.dart';
import 'category_item.dart';

class CategoriesSection extends StatelessWidget {
  final List<CategorySectionEntity> categories;
  const CategoriesSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.categories(),
        SizedBox(height: 8.h),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) =>
                CategoryItem(category: categories[index]),
          ),
        ),
      ],
    );
  }
}