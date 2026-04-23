import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';

class AppText {
  static Widget forgotPassword() {
    return Text(
      "Forgot Password?",
      style: getRegularStyle(color: ColorManager.primary, fontSize: 15.sp),
    );
  }

  static Widget loginWithGoogle() {
    return Text(
      "Login with Google",
      style: getSemiBoldStyle(color: ColorManager.black, fontSize: 16.sp),
    );
  }

  static Widget dontHaveAccount() {
    return Text(
      "Don't have an account?",
      style: getRegularStyle(color: ColorManager.grey, fontSize: 14.sp),
    );
  }
  static Widget login() {
    return Text(
      "Login",
      style: getSemiBoldStyle(color: ColorManager.white, fontSize: 14.sp),
    );
  }
  static Widget orLoginWith() {
    return Text(
      "Or Login with",
      style: getRegularStyle(color: ColorManager.black, fontSize: 12.sp),
    );
  }
  static Widget signUp() {
    return Text(
      "Sign up",
      style: getSemiBoldStyle(color: ColorManager.primary, fontSize: 12.sp),
    );
  }
}