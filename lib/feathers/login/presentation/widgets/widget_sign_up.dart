import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class WidgetSignUp extends StatelessWidget {
  const WidgetSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: getRegularStyle(
            color: ColorManager.greyBorder,
            fontSize: 13.sp,
          ),
        ),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Sign up",
            style: getSemiBoldStyle(
              color: ColorManager.primary,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
