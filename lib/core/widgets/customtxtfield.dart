import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  final IconData? icon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final int? maxLines;
  final bool? enabled;
  final Color? backgroundColor;
  final TextStyle? hintStyle;

  final double? width;
  final double? height;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.obscureText,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.maxLines,
    this.enabled,
    this.backgroundColor,
    this.hintStyle,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 55,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType ?? TextInputType.text,
        validator: validator,
        onChanged: onChanged,
        maxLines: maxLines ?? 1,
        enabled: enabled ?? true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          isDense: true,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,

          hintStyle:
              hintStyle ?? TextStyle(color: Colors.grey.shade600, fontSize: 14),

          filled: true,
          fillColor: backgroundColor ?? const Color(0xFFF2F2F2),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: ColorManager.grey, width: 1),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: ColorManager.primary,
              width: 1.5,
            ),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: ColorManager.grey, width: 1),
          ),
        ),
      ),
    );
  }
}
