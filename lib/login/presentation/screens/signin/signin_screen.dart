import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/login/presentation/manager/login_controller.dart';
import 'package:zonka_feedback/login/presentation/screens/signin/other_signin_screen.dart';

import 'package:zonka_feedback/login/presentation/widget/input_text_field.dart';
import 'package:zonka_feedback/utils/color_constant.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final loginController = Get.put(LoginController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign In',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22.sp,
                  color: const Color(ColorConstant.signupTextColor)),
            ),
            SizedBox(
              height: 20.h,
            ),
            InputTextFormField(
              controller: loginController.emailTextController,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return 'Please Enter Email';
                }
                return null;
              },
              formFeildHeading: 'Email',
            ),
            SizedBox(
              height: 30.h,
            ),
            InputTextFormField(
              controller: loginController.passwordTextController,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return 'Please Enter Email';
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
              height: 40.h,
            ),
            Container(
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
                'Sign In',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(children: [
              Expanded(
                  child: Divider(
                endIndent: 15.w,
                indent: 18.w,
                color:
                    const Color(ColorConstant.signupTextColor).withOpacity(0.5),
              )),
              Text(
                "OR",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: const Color(ColorConstant.signupTextColor)
                      .withOpacity(0.5),
                ),
              ),
              Expanded(
                  child: Divider(
                endIndent: 18.w,
                indent: 20.w,
                color:
                    const Color(ColorConstant.signupTextColor).withOpacity(0.5),
              )),
            ]),
            SizedBox(
              height: 20.h,
            ),
            const OtherLoginWidget(),
            Container(
              width: 297.w,
              margin: EdgeInsets.symmetric(vertical: 20.h),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account ? ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        color: Color(ColorConstant.signupTextColor)),
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        color: Color(
                          ColorConstant.signUpButtonColor,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
