// product_image_section.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImageSection extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductImageSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 225.h,
        width: 168.w,
        color: product['color'] as Color,
        child: Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            product['image'] as String,
            width: 168.w,
            height: 116.h,
          ),
        ),
      ),
    );
  }
}