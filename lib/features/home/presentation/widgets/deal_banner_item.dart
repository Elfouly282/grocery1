import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entity/meal_entity.dart';
import 'deal_description.dart';
import 'deal_title.dart';
import 'offer_badge.dart';

class DealBannerItem extends StatelessWidget {
  final MealEntity meal;

  const DealBannerItem({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354.w,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        image: DecorationImage(
          image: NetworkImage(meal.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (meal.offerTitle != null) ...[
                OfferBadge(offerTitle: meal.offerTitle!),
                SizedBox(height: 8.h),
              ],
              DealTitle(title: meal.title),
              SizedBox(height: 8.h),
              DealDescription(description: meal.description),
            ],
          ),
        ),
      ),
    );
  }
}