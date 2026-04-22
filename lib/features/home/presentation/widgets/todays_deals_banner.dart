import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/appassets.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';

class TodaysDealsBanner extends StatelessWidget {
  const TodaysDealsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text("Today's Deals",
             style:getMediumStyle(color: ColorManager.black,fontSize:16.sp )),
         SizedBox(height: 12.h),
        Image.asset(AppAssets.frame214,width: 354.w,height:142.h ,),
        SizedBox(height: 12.h),
      ],
    );
  }
}