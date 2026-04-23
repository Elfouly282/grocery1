import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/utils/app_text.dart';

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
            borderRadius: BorderRadius.circular(7.r),
          ),
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
        child: AppText.addToCart(),

      ),
    );
  }
}