import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  final int id;
  final bool isSelected;
  final VoidCallback onTap;

  const ProductItemWidget({
    super.key,
    required this.id,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(child: Container(color: Colors.grey[300])),
            const SizedBox(height: 6),
            Text("Product $id"),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
