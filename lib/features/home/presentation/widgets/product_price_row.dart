// product_price_row.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class ProductPriceRow extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductPriceRow({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '£${(product['price'] as double).toStringAsFixed(0)}',
          style: getMediumStyle(color: ColorManager.primary, fontSize: 16.sp),
        ),
        if (product['oldPrice'] != null) ...[
          const SizedBox(width: 6),
          Text(
            '£${(product['oldPrice'] as double).toStringAsFixed(0)}',
            style: getRegularStyle(
              color: ColorManager.grey,
              fontSize: 14.sp,
            ).copyWith(
              decoration: TextDecoration.lineThrough,
              decorationColor: ColorManager.grey,
            ),
          ),
        ],
      ],
    );
  }
}