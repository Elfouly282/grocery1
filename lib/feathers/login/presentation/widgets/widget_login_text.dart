import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class WidgetLoginText extends StatelessWidget {
  const WidgetLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Or Login with",
      style: getRegularStyle(color: ColorManager.black, fontSize: 12.sp),
    );
  }
}
