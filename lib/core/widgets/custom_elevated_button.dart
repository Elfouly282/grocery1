import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/font_manager.dart';

import '../resources/styles_manager.dart';


class CustomElevatedButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final Color? backgroundColor;
  final double? radius;
  final void Function()? onTap;
  final TextStyle? textStyle;
  final bool isStadiumBorder;
  final Widget? child;

  const CustomElevatedButton({
    this.prefixIcon,
    this.textStyle,
    this.isStadiumBorder = true,
    this.backgroundColor,
    this.radius,
    this.suffixIcon,
    this.label,
    required this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: isStadiumBorder
            ? const StadiumBorder()
            : RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.r)),
        backgroundColor: backgroundColor ?? ColorManager.primary,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
      ),
      onPressed: onTap,
      child:
          child ??
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              prefixIcon ?? const SizedBox(),
              if (prefixIcon != null) SizedBox(width: 8.w),
              Text(
                label ?? '',
                style:
                    textStyle ??
                    getMediumStyle(
                      color: ColorManager.white,
                    ).copyWith(fontSize: FontSize.s20),
              ),
              if (suffixIcon != null) SizedBox(width: 8.w),
              suffixIcon ?? const SizedBox(),
            ],
          ),
    );
  }
}
