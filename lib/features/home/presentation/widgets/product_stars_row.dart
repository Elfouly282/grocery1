import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class ProductStarsRow extends StatelessWidget {
  const ProductStarsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(5, (i) => Icon(
          Icons.star,
          size: 12,
          color: ColorManager.orange,
        )),
        SizedBox(width: 2.w),
        Text(
          '(4)',
          style: getMediumStyle(color: ColorManager.grey, fontSize: 10.sp),
        ),
      ],
    );
  }
}