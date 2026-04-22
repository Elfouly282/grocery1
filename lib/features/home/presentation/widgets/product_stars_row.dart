// product_stars_row.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class ProductStarsRow extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductStarsRow({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final double rating = product['rating'] as double;
    return Row(
      children: [
        ...List.generate(5, (i) => Icon(
          Icons.star,
          size: 12,
          color: i < rating.floor() ? ColorManager.orange : ColorManager.grey,
        )),
        SizedBox(width: 2.w),
        Text(
          '(${product['reviews']})',
          style: getMediumStyle(color: ColorManager.grey, fontSize: 10.sp),
        ),
      ],
    );
  }
}