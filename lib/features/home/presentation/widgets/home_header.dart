import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/appassets.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/utils/app_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: ColorManager.appbarBackground,
      child: Row(
        children: [
          Image.asset(AppAssets.vector1, width: 30.w, height: 34.h),
          SizedBox(width: 14.w),
          Stack(
            children: [
              Icon(
                Icons.notifications_outlined,
                size: 24,
                color: ColorManager.primary,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: ColorManager.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(child: Text('.')),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              width: 165.w,
              height: 28.h,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.lightGrey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 18,
                    color: ColorManager.primary,
                  ),
                  SizedBox(width: 3.w),
                  Expanded(child: AppText.address()),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 20.sp,
                    color: ColorManager.grey,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Builder(
            builder: (context) => GestureDetector(
              onTap: () => Scaffold.of(context).openEndDrawer(),
              child: Stack(
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 24,
                    color: ColorManager.black,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                        color: ColorManager.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}