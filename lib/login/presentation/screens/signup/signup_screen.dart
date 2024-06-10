import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/login/presentation/manager/signup_controller.dart';
import 'package:zonka_feedback/login/presentation/manager/switch_screen_controller.dart';
import 'package:zonka_feedback/login/presentation/screens/signup/other_signup_screen.dart';
import 'package:zonka_feedback/utils/color_constant.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpController = Get.put(SignupController());
  final switchScreenController = Get.put(SwitchScreenController());
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'Sign Up',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                color: const Color(ColorConstant.signupTextColor)),
          ),
          SizedBox(
            height: 20.h,
          ),
          const OtherSignUpScreen(),
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
                color:
                    const Color(ColorConstant.signupTextColor).withOpacity(0.5),
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
          GestureDetector(
            onTap: () {
              switchScreenController.changeScreen(Screen.createaccount);
            },
            child: Container(
              width: 330.w,
              height: 35.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                "Create Account",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Datacenter',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: const Color(
                      ColorConstant.signupTextColor,
                    )),
              ),
              SizedBox(
                height: 5.h,
              ),
              Obx(() {
                return Container(
                  width: 330.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color:
                            const Color(ColorConstant.dataCenterBorderColor)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: signUpController.dataCenter.value,
                    isExpanded: true,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    items: <String>['US', 'EU'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    underline: Container(),
                    hint: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: const Text('Select Datacenter')),
                    onChanged: (value) {
                      signUpController.setDataCenter(value);
                    },
                  ),
                );
              }),
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
                            color: const Color(
                              ColorConstant.signUpButtonColor,
                            )),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
