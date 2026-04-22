import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/features/home/presentation/widgets/product_details_section.dart';
import 'package:grocery1/features/home/presentation/widgets/product_favorite_button.dart';
import 'package:grocery1/features/home/presentation/widgets/product_image_section.dart';

// class ProductCard extends StatelessWidget {
//   final Map<String, dynamic> product;
//   const ProductCard({super.key, required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: ColorManager.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: _buildImageSection(),
//     );
//   }
//
//   Widget _buildImageSection() {
//     return Stack(
//       alignment: Alignment.topCenter,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: Container(
//             height: 225.h,
//             width: 168.w,
//             color: product['color'] as Color,
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: Image.asset(
//                 product['image'] as String,
//                 width: 168.w,
//                 height: 116.h,
//               ),
//             ),
//           ),
//         ),
//         // الفاوريت
//         Positioned(
//           top: 8, right: 8,
//           child: Container(
//             padding: const EdgeInsets.all(5),
//             decoration:  BoxDecoration(
//               color: ColorManager.grey,
//               shape: BoxShape.circle,
//             ),
//             child:  Icon(Icons.favorite_border,
//                 size: 16.sp, color: ColorManager.greyBorder),
//           ),
//         ),
//         // الاسم والتفاصيل
//         Positioned(
//           bottom:0,
//           left: 0,
//           right: 0,
//           child: Container(
//             padding: const EdgeInsets.all(6),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildNameRow(),
//                 const SizedBox(height: 4),
//                 _buildStarsRow(),
//                 const SizedBox(height: 6),
//                 _buildPriceRow(),
//                 const SizedBox(height: 8),
//                 _buildAddToCartButton(),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildNameRow() {
//     return Row(
//       children: [
//         Text(
//           product['name'] as String,
//           style:getMediumStyle(color: ColorManager.black,fontSize: 16.sp)
//
//         ),
//          SizedBox(width: 6.w),
//         Text(
//           '(${product['weight']})',
//           style:getRegularStyle(color: ColorManager.black,fontSize: 10)
//         ),
//       ],
//     );
//   }
//
//   Widget _buildStarsRow() {
//     final double rating = product['rating'] as double;
//     return Row(
//       children: [
//         ...List.generate(5, (i) => Icon(
//           i < rating.floor() ? Icons.star : Icons.star,
//           size: 12,
//           color: i < rating.floor()
//               ? ColorManager.orange
//               : ColorManager.grey,
//         )),         SizedBox(width: 2.w),
//         Text(
//           '(${product['reviews']})',
//           style:getMediumStyle(color: ColorManager.grey,fontSize: 10.sp)
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPriceRow() {
//     return Row(
//       children: [
//         Text(
//           '£${(product['price'] as double).toStringAsFixed(0)}',
//           style:getMediumStyle(color: ColorManager.primary,fontSize: 16.sp)
//
//         ),
//         if (product['oldPrice'] != null) ...[
//           const SizedBox(width: 6),
//     Text(
//     '£${(product['oldPrice'] as double).toStringAsFixed(0)}',
//     style: getRegularStyle(
//     color: ColorManager.grey,
//     fontSize: 14.sp,
//     ).copyWith(
//     decoration: TextDecoration.lineThrough,
//     decorationColor: ColorManager.grey,
//     ),
//
//
//           ),
//         ],
//       ],
//     );
//   }
//
//   Widget _buildAddToCartButton() {
//     return SizedBox(
//       width: 156.w,
//        height: 32.h,
//       child: ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//           backgroundColor: ColorManager.primary,
//           foregroundColor: ColorManager.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(7),
//           ),
//           elevation: 0,
//           padding: EdgeInsets.zero,
//         ),
//         child:  Text(
//           'Add to cart',
//           style:getSemiBoldStyle(color: ColorManager.white,fontSize: 18.sp)
//         ),
//       ),
//     );
//   }
// }
// product_card.dart
class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ProductImageSection(product: product),
          ProductFavoriteButton(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ProductDetailsSection(product: product),
          ),
        ],
      ),
    );
  }
}