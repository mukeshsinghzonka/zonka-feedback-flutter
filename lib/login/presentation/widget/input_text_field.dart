import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/utils/color_constant.dart';

class InputTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String formFeildHeading;
  final String? errorText;
  final Widget? suffixWidget;
  final String? Function(String?)? validator;
  final bool ?obscureText;
  const InputTextFormField(
      {super.key,
      required this.controller,
      required this.formFeildHeading,
       this.errorText,
      this.suffixWidget,
      this.obscureText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formFeildHeading,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: const Color(ColorConstant.signupTextColor)),
        ),
        SizedBox(
          height: 2.h,
        ),
          TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscureText ?? false,
          
            decoration: InputDecoration(
              fillColor: Colors.white,
              errorText: errorText, 
              isDense: true,
              suffixIcon: suffixWidget,
              suffixIconConstraints: suffixWidget !=null? BoxConstraints(
                minHeight: 8.h,
              ):null,
              contentPadding: EdgeInsets.all(9.sp),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
                borderSide: const BorderSide(
                  color: Colors.blue,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
                borderSide: const BorderSide(
                  color: Color(ColorConstant.signUpTextBorderColor),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        
      ],
    );
  }
}
