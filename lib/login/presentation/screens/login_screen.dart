import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zonka_feedback/login/presentation/screens/signup/create_account_screen.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool first = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(ColorConstant.signUpBackgroudColor),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            SvgPicture.asset(ImageConstant.zonkaImageLogo),
            SizedBox(
              height: 50.h,
            ),
         
           CreateScreen()
          ],
        ),
      )),
    );
  }
}
