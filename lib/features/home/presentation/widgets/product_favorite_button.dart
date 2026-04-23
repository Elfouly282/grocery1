
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class ProductFavoriteButton extends StatelessWidget {
  const ProductFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: ColorManager.colorBg,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.favorite,
          size: 13.sp,
          color: ColorManager.greyBorder,
        ),
      ),
    );
  }
}