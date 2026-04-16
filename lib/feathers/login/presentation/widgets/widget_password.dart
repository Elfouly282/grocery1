import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widgets/customtxtfield.dart';

class WidgetPassword extends StatelessWidget {
  WidgetPassword({super.key});
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: passwordController,
      hintText: '********',

      prefixIcon: const Icon(
        Icons.lock_open_outlined,
        color: ColorManager.greyBorder,
        size: 16,
      ),
      hintStyle: getRegularStyle(
        color: ColorManager.greyBorder,
        fontSize: 12.sp,
      ),
      suffixIcon: const Icon(
        Icons.visibility_off,
        color: ColorManager.greyBorder,
        size: 21,
      ),
      backgroundColor: Colors.white,
    );
  }
}
