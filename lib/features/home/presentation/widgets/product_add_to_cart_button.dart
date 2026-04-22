// product_add_to_cart_button.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class ProductAddToCartButton extends StatelessWidget {
  const ProductAddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 156.w,
      height: 32.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          foregroundColor: ColorManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
        child: Text(
          'Add to cart',
          style: getSemiBoldStyle(color: ColorManager.white, fontSize: 18.sp),
        ),
      ),
    );
  }
}