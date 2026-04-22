import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  // required 
  final TextEditingController controller; 
    final String hintText; 
// Optional
  final IconData? icon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final int? maxLines;
  final bool? enabled;
  final Color? backgroundColor;
  final Color? hintColor;
  final FontWeight? hintWeight;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.obscureText,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.onChanged,
    this.maxLines,
    this.enabled,
    this.backgroundColor,
    this.hintColor,
    this.hintWeight,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines ?? 1,
      enabled: enabled ?? true,
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon) : null,
        prefixIconColor: Colors.grey,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 12),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor,
          fontWeight: hintWeight
        ),
        filled: true,
        fillColor: backgroundColor ?? const Color(0xFFF2F2F2),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}