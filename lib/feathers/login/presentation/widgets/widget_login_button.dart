import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';

class WidgetLoginButton extends StatelessWidget {
  const WidgetLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 358.w,
          height: 50.h,
          child: CustomElevatedButton(
            isStadiumBorder: false,
            radius: 8,
            backgroundColor: ColorManager.primary,
            onTap: () {},
            child: Text(
              "Login",
              style: getSemiBoldStyle(
                color: ColorManager.white,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
