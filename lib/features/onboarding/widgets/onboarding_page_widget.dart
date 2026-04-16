import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPageWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // الصورة
         Spacer(),
          Expanded(
            flex: 8,
            child: Image.asset(image,height: 199,),
          ),

          // العنوان

          Expanded(
            flex: 2,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          // الوصف
          Expanded(
            flex: 2,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}