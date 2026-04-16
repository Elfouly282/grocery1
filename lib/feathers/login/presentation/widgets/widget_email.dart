import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widgets/customtxtfield.dart';

class WidgetEmail extends StatelessWidget {
  WidgetEmail({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: emailController,
      hintText: 'Sarahem@gmail.com',
      prefixIcon: Icon(
        Icons.email_outlined,
        size: 20.sp,
        color: ColorManager.greyBorder,
      ),
      hintStyle: getRegularStyle(
        color: ColorManager.greyBorder,
        fontSize: 12.sp,
      ),

      backgroundColor: Colors.white,
    );
  }
}
