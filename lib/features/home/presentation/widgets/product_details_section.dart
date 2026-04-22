// product_details_section.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery1/features/home/presentation/widgets/product_add_to_cart_button.dart';
import 'package:grocery1/features/home/presentation/widgets/product_name_row.dart';
import 'package:grocery1/features/home/presentation/widgets/product_price_row.dart';
import 'package:grocery1/features/home/presentation/widgets/product_stars_row.dart';


class ProductDetailsSection extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductDetailsSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductNameRow(product: product),
          const SizedBox(height: 4),
          ProductStarsRow(product: product),
          const SizedBox(height: 6),
          ProductPriceRow(product: product),
          const SizedBox(height: 8),
          const ProductAddToCartButton(),
        ],
      ),
    );
  }
}