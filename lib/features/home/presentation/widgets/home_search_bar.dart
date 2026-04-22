import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:354.w ,
      height: 42.h,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: ColorManager.search,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
           Icon(Icons.search,
              color: ColorManager.primary, size: 24),
           SizedBox(width: 5.w),
           Expanded(child:
          Text('Search for any Product',
              style:getRegularStyle(color: ColorManager.greyBorder,
              )
             )),
          Icon(Icons.qr_code_scanner,
              size: 24.sp, color: ColorManager.primary),
          const SizedBox(width: 8),
          const Icon(Icons.mic_none, size: 24, color: ColorManager.primary),
        ],
      ),
    );
  }
}