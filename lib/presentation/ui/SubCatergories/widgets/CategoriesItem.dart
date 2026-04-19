import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/font_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String title;

  const CategoryItem({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 110.h,
      child: Card(
        elevation: 1,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        margin: EdgeInsets.only(right: 10.w),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10.h),
             height: 60.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child:CachedNetworkImage(
                    imageUrl: image,
                    width: 68.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text(
                    title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: getMediumStyle(color:ColorManager.black,fontSize: FontSize.s14,fontFamily: FontConstants.interFontFamily )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}