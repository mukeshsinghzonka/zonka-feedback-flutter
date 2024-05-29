

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class OtherSignUpScreen extends StatefulWidget {
  const OtherSignUpScreen({super.key});

  @override
  State<OtherSignUpScreen> createState() => _OtherSignUpScreenState();
}

class _OtherSignUpScreenState extends State<OtherSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 330.w,
            height: 40.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: Colors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 SvgPicture.asset(ImageConstant.microSoftImageLogo),
                 SizedBox(width: 10.w,),
                 Text('Sign Up with Microsoft',style: TextStyle(fontWeight: FontWeight.w600),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}