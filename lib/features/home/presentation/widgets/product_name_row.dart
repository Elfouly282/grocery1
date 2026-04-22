// product_name_row.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class ProductNameRow extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductNameRow({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          product['name'] as String,
          style: getMediumStyle(color: ColorManager.black, fontSize: 16.sp),
        ),
        SizedBox(width: 6.w),
        Text(
          '(${product['weight']})',
          style: getRegularStyle(color: ColorManager.black, fontSize: 10),
        ),
      ],
    );
  }
}