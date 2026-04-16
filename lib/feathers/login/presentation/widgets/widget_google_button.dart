import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/appassets.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class WidgetGoogleButton extends StatelessWidget {
  const WidgetGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 354.w,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ColorManager.grey),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.googleIcon, width: 24.w, height: 24.h),
          SizedBox(width: 8.w),
          Text(
            "Login with Google",
            style: getSemiBoldStyle(color: ColorManager.black, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
