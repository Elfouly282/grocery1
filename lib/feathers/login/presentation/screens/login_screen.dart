import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../widgets/widget_email.dart';
import '../widgets/widget_forgot_password.dart';
import '../widgets/widget_google_button.dart';
import '../widgets/widget_header.dart';
import '../widgets/widget_login_button.dart';
import '../widgets/widget_login_text.dart';
import '../widgets/widget_logo.dart';
import '../widgets/widget_password.dart';
import '../widgets/widget_sign_up.dart';
import '../widgets/widget_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.colorBg,
      body: Column(
        children: [
          WidgetHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Column(
                  children: [
                    WidgetLogo(),
                    SizedBox(height: 32.h),
                    WidgetTitle(),
                    SizedBox(height: 16.h),
                    WidgetEmail(),
                    SizedBox(height: 8.h),
                    WidgetPassword(),
                    SizedBox(height: 8.h),
                    WidgetForgotPassword(),
                    SizedBox(height: 10.h),
                    WidgetLoginButton(),
                    SizedBox(height: 15.h),
                    WidgetLoginText(),
                    SizedBox(height: 15.h),
                    WidgetGoogleButton(),
                    SizedBox(height: 12.h),
                    WidgetSignUp(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
