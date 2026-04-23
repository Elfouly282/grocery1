import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../domain/entity/recommended_meal_entity.dart';

class ProductNameRow extends StatelessWidget {
  final RecommendedMealEntity meal;
  const ProductNameRow({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            meal.title,
            style: getMediumStyle(color: ColorManager.black, fontSize: 12.sp),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        SizedBox(width: 6.w),
        Text(
          meal.category.name,
          style: getRegularStyle(color: ColorManager.black, fontSize: 10),
        ),
      ],
    );
  }
}