import 'package:flutter/material.dart';

class ImagePickerWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String? imagePath;

  const ImagePickerWidget({super.key, required this.onTap, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: imagePath == null
            ? const Icon(Icons.image, size: 40)
            : ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(imagePath!, fit: BoxFit.cover),
              ),
      ),
    );
  }
}
