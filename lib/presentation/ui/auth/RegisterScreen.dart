import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/appassets.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/font_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';
import 'package:grocery1/core/utils/validator.dart';
import 'package:grocery1/presentation/ui/auth/cubit/register_states.dart';

import '../../../core/di/servicelocator.dart';
import '../../../core/utils/dialog_utils.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import 'cubit/register_view_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterViewModel viewModel=getIt<RegisterViewModel>();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading ...');

        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.errorMessage.failuremessage,
            title: 'Error',
            posActionName: "OK",
          );
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: 'Register Success ',
            title: 'Success',
            posActionName: 'OK',
          );
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 270.h,
                    width: double.infinity,
                    child: Image.asset(
                      AppAssets.rectangle109,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 80.w,
                    top: 186.h,
                    child: Text(
                      "Create your Account",
                      style: getSemiBoldStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s24,
                        fontFamily: FontConstants.interFontFamily,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "Just a few things to get started",
                        style: getRegularStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s14,
                          fontFamily: FontConstants.interFontFamily,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Form(
                        key: viewModel.formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              controller: viewModel.mailController,
                              validator: Validator.validateEmail,
                              isPassword: false,
                              keyboardType: TextInputType.name,
                              isObscureText: false,
                              hintText: "Email or PhoneNumber",
                              filledColor: ColorManager.baseWhite,
                              hintStyle: getRegularStyle(
                                color: ColorManager.darkGrey,
                                fontFamily: FontConstants.interFontFamily,
                                fontSize: FontSize.s12,
                              ),
                              labelStyle: getRegularStyle(
                                color: ColorManager.darkGrey,
                                fontFamily: FontConstants.interFontFamily,
                                fontSize: FontSize.s12,
                              ),
                              borderColor: ColorManager.darkGrey,
                              textStyle: getRegularStyle(
                                color: ColorManager.darkGrey,
                                fontFamily: FontConstants.interFontFamily,
                                fontSize: FontSize.s12,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(
                                  AppAssets.letter,
                                  width: 20.w,
                                  height: 20.h,
                                ),

                                // controller: viewModel.mailController,
                              ),
                            ),
                            CustomTextFormField(
                              controller: viewModel.fullNameController,
                              validator: Validator.validateFullName,
                              isPassword: false,
                              keyboardType: TextInputType.name,
                              isObscureText: false,
                              hintText: "UserName",
                              filledColor: ColorManager.baseWhite,
                              hintStyle: getRegularStyle(
                                color: ColorManager.darkGrey,
                                fontFamily: FontConstants.interFontFamily,
                                fontSize: FontSize.s12,
                              ),
                              labelStyle: getRegularStyle(
                                color: ColorManager.darkGrey,
                                fontFamily: FontConstants.interFontFamily,
                                fontSize: FontSize.s12,
                              ),
                              borderColor: ColorManager.darkGrey,
                              textStyle: getRegularStyle(
                                color: ColorManager.darkGrey,
                                fontFamily: FontConstants.interFontFamily,
                                fontSize: FontSize.s12,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(
                                  AppAssets.user,
                                  width: 20.w,
                                  height: 20.h,
                                ),

                                // controller: viewModel.mailController,
                              ),
                            ),
                            CustomTextFormField(
                              controller: viewModel.passwordController,
                              validator: Validator.validatePassword,
                              isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                              isObscureText: true,
                              hintText: "Password",
                              filledColor: ColorManager.baseWhite,
                              hintStyle: getRegularStyle(
                                color: ColorManager.darkGrey,
                                fontFamily: FontConstants.interFontFamily,
                                fontSize: FontSize.s12,
                              ),
                              labelStyle: getRegularStyle(
                                color: ColorManager.darkGrey,
                                fontFamily: FontConstants.interFontFamily,
                                fontSize: FontSize.s12,
                              ),
                              borderColor: ColorManager.darkGrey,
                              textStyle: getRegularStyle(
                                color: ColorManager.darkGrey,
                                fontFamily: FontConstants.interFontFamily,
                                fontSize: FontSize.s12,
                              ),
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.lock_outlined,
                                  color: ColorManager.darkGrey,
                                ),
                              ),
                            ),
                            CustomTextFormField(
                              controller: viewModel.rePasswordController,
                              // validator: Validator.validateConfirmPassword ,
                              isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                              isObscureText: true,
                              hintText: "confirm Password",
                              filledColor: ColorManager.baseWhite,
                              hintStyle: getRegularStyle(
                                color: ColorManager.darkGrey,
                                fontFamily: FontConstants.interFontFamily,
                                fontSize: FontSize.s12,
                              ),
                              labelStyle: getRegularStyle(
                                color: ColorManager.darkGrey,
                                fontFamily: FontConstants.interFontFamily,
                                fontSize: FontSize.s12,
                              ),
                              borderColor: ColorManager.darkGrey,
                              textStyle: getRegularStyle(
                                color: ColorManager.darkGrey,
                                fontFamily: FontConstants.interFontFamily,
                                fontSize: FontSize.s12,
                              ),
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.lock_outlined,
                                  color: ColorManager.darkGrey,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value ?? false;
                                    });
                                  },
                                ),
                                Text("Accept terms"),
                              ],
                            ),



                            CustomElevatedButton(onTap: viewModel.register,label: "SignUp",
                              backgroundColor: ColorManager.primary,
                              radius: 8.0.r,
                              isStadiumBorder: false,)
                          ],
                        ),
                      ),

                      // controller: viewModel.mailController
                      Text(
                        "Or sign up with",
                        style: getRegularStyle(color: ColorManager.black),
                      ),

                      const SizedBox(height: 12),

                      // 🌐 Social Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              AppAssets.logoFacebook,
                              width: 38.w,
                              height: 38.h,
                            ),
                          ),
                          SizedBox(width: 15.w),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              AppAssets.googleIcon,
                              width: 38.w,
                              height: 38.h,
                            ),
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              AppAssets.mailLogo,
                              width: 38.w,
                              height: 38.h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 270.h,
                  width: double.infinity,
                  child: Image.asset(AppAssets.rectangle109, fit: BoxFit.cover),
                ),
                Positioned(
                  left: 80.w,
                  top: 186.h,
                  child: Text(
                    "Create your Account",
                    style: getSemiBoldStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s24,
                      fontFamily: FontConstants.interFontFamily,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Just a few things to get started",
                      style: getRegularStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s14,
                        fontFamily: FontConstants.interFontFamily,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextFormField(
                      isPassword: false,
                      keyboardType: TextInputType.name,
                      isObscureText: false,
                      hintText: "Email or PhoneNumber",
                      filledColor: ColorManager.baseWhite,
                      hintStyle: getRegularStyle(
                        color: ColorManager.darkGrey,
                        fontFamily: FontConstants.interFontFamily,
                        fontSize: FontSize.s12,
                      ),
                      labelStyle: getRegularStyle(
                        color: ColorManager.darkGrey,
                        fontFamily: FontConstants.interFontFamily,
                        fontSize: FontSize.s12,
                      ),
                      borderColor: ColorManager.darkGrey,
                      textStyle: getRegularStyle(
                        color: ColorManager.darkGrey,
                        fontFamily: FontConstants.interFontFamily,
                        fontSize: FontSize.s12,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          AppAssets.letter,
                          width: 20.w,
                          height: 20.h,
                        ),

                        // controller: viewModel.mailController,
                      ),
                    ),
                    CustomTextFormField(
                      isPassword: false,
                      keyboardType: TextInputType.name,
                      isObscureText: false,
                      hintText: "UserName",
                      filledColor: ColorManager.baseWhite,
                      hintStyle: getRegularStyle(
                        color: ColorManager.darkGrey,
                        fontFamily: FontConstants.interFontFamily,
                        fontSize: FontSize.s12,
                      ),
                      labelStyle: getRegularStyle(
                        color: ColorManager.darkGrey,
                        fontFamily: FontConstants.interFontFamily,
                        fontSize: FontSize.s12,
                      ),
                      borderColor: ColorManager.darkGrey,
                      textStyle: getRegularStyle(
                        color: ColorManager.darkGrey,
                        fontFamily: FontConstants.interFontFamily,
                        fontSize: FontSize.s12,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          AppAssets.user,
                          width: 20.w,
                          height: 20.h,
                        ),

                        // controller: viewModel.mailController,
                      ),
                    ),
                    CustomTextFormField(
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword,
                      isObscureText: true,
                      hintText: "Password",
                      filledColor: ColorManager.baseWhite,
                      hintStyle: getRegularStyle(
                        color: ColorManager.darkGrey,
                        fontFamily: FontConstants.interFontFamily,
                        fontSize: FontSize.s12,
                      ),
                      labelStyle: getRegularStyle(
                        color: ColorManager.darkGrey,
                        fontFamily: FontConstants.interFontFamily,
                        fontSize: FontSize.s12,
                      ),
                      borderColor: ColorManager.darkGrey,
                      textStyle: getRegularStyle(
                        color: ColorManager.darkGrey,
                        fontFamily: FontConstants.interFontFamily,
                        fontSize: FontSize.s12,
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.lock_outlined,
                          color: ColorManager.darkGrey,
                        ),
                      ),
                    ),
                    CustomTextFormField(
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword,
                      isObscureText: true,
                      hintText: "confirm Password",
                      filledColor: ColorManager.baseWhite,
                      hintStyle: getRegularStyle(
                        color: ColorManager.darkGrey,
                        fontFamily: FontConstants.interFontFamily,
                        fontSize: FontSize.s12,
                      ),
                      labelStyle: getRegularStyle(
                        color: ColorManager.darkGrey,
                        fontFamily: FontConstants.interFontFamily,
                        fontSize: FontSize.s12,
                      ),
                      borderColor: ColorManager.darkGrey,
                      textStyle: getRegularStyle(
                        color: ColorManager.darkGrey,
                        fontFamily: FontConstants.interFontFamily,
                        fontSize: FontSize.s12,
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.lock_outlined,
                          color: ColorManager.darkGrey,
                        ),
                      ),
                    ),
                    // controller: viewModel.mailController
                    Row(
                      children: [
                        Checkbox(
                          activeColor: ColorManager.primary,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                        ),
                        const Expanded(
                          child: Text(
                            "I agree to the policies and terms",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    // SizedBox(
                    //   width: double.infinity,
                    //   // child: ElevatedButton(
                    //   //   style: ElevatedButton.styleFrom(
                    //   //     backgroundColor: const Color(0xFF0F4C5C),
                    //   //     padding: const EdgeInsets.symmetric(vertical: 14),
                    //   //     shape: RoundedRectangleBorder(
                    //   //       borderRadius: BorderRadius.circular(8),
                    //   //     ),
                    //   //   ),
                    //   //   onPressed: () {},
                    //   //   child: const Text("Sign Up"),
                    //   )
                    CustomElevatedButton(
                      onTap: () {},
                      label: "SignUp",
                      radius: 8.0.r,
                      isStadiumBorder: false,
                    ),
                    SizedBox(height: 15.h),

                    Text(
                      "Or sign up with",
                      style: getRegularStyle(color: ColorManager.black),
                    ),

                    const SizedBox(height: 12),

                    // 🌐 Social Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            AppAssets.logoFacebook,
                            width: 38.w,
                            height: 38.h,
                          ),
                        ),
                        SizedBox(width: 15.w),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            AppAssets.googleIcon,
                            width: 38.w,
                            height: 38.h,
                          ),
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            AppAssets.mailLogo,
                            width: 38.w,
                            height: 38.h,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
