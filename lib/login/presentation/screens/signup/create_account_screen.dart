import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/login/presentation/manager/signup_controller.dart';
import 'package:zonka_feedback/login/presentation/manager/switch_screen_controller.dart';
import 'package:zonka_feedback/login/presentation/widget/input_text_field.dart';
import 'package:zonka_feedback/utils/color_constant.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final signUpController = Get.put(SignupController());
  final switchScreenController = Get.put(SwitchScreenController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22.sp,
                    color: const Color(ColorConstant.signupTextColor)),
              ),
              SizedBox(
                height: 20.h,
              ),
              InputTextFormField(
                controller: signUpController.nameTextController,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Please Enter Name';
                  }
                  return null;
                },
                formFeildHeading: 'Name',
              ),
              SizedBox(
                height: 20.h,
              ),
              InputTextFormField(
                controller: signUpController.emailTextController,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Please Enter Email';
                  }
                  return null;
                },
                formFeildHeading: 'Email',
              ),
              SizedBox(
                height: 20.h,
              ),
              InputTextFormField(
                controller: signUpController.passwordTextController,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Please Enter Password';
                  }
                  return null;
                },
                formFeildHeading: 'Password',
                obscureText: showPassword,
                suffixWidget: GestureDetector(
                    onTap: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    child: showPassword
                        ? const Icon(
                            Icons.visibility_off,
                            color: Color(ColorConstant.signUpTextBorderColor),
                          )
                        : const Icon(Icons.visibility,
                            color: Color(ColorConstant.signUpTextBorderColor))),
              ),
              SizedBox(
                height: 20.h,
              ),
              InputTextFormField(
                controller: signUpController.companyNameTextController,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Please Enter Company Name';
                  }
                  return null;
                },
                formFeildHeading: 'Company Name',
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  if(_formKey.currentState!.validate()){
                      signUpController.signupUser(context: context);
                  }
                },
                child: Container(
                  width: 331.w,
                  height: 46.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(ColorConstant.signUpButtonColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.r),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp),
                  ),
                ),
              ),

             Container(
              width: 297.w,
              margin: EdgeInsets.symmetric(vertical: 20.h),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        color: const Color(ColorConstant.signupTextColor)),
                  ),
                  GestureDetector(
                    onTap: () {
                     switchScreenController.changeScreen(Screen.login);
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color:const  Color(
                            ColorConstant.signUpButtonColor,
                          )),
                    ),
                  )
                ],
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}
