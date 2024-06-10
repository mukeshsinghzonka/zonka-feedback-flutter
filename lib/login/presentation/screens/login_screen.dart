import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/login/presentation/manager/switch_screen_controller.dart';
import 'package:zonka_feedback/login/presentation/screens/signin/signin_screen.dart';
import 'package:zonka_feedback/login/presentation/screens/signup/create_account_screen.dart';
import 'package:zonka_feedback/login/presentation/screens/signup/signup_screen.dart';
import 'package:zonka_feedback/services/device_info/location_info.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool first = true;
  final switchScreenController = Get.put(SwitchScreenController());
   
   @override
  void initState() {
    LocationService().getLocation();
    super.initState();
  }


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
            GestureDetector(
                onTap: () {
                  setState(() {
                    first = !first;
                  });
                },
                child: SvgPicture.asset(ImageConstant.zonkaImageLogo)),
            SizedBox(
              height: 50.h,
            ),
            Obx(() {
              return AnimatedSwitcher(
                switchOutCurve: Curves.linear,
                duration:const Duration(seconds: 1),
                child:
                    switchScreenController.currentScreen.value == Screen.login
                        ? const SignInScreen()
                        : switchScreenController.currentScreen.value == Screen.signup
                        ? const SignUpScreen()  
                        : switchScreenController.currentScreen.value == Screen.createaccount ? const CreateScreen() 
                        : Container(),
              );
            }),
         
          ],
        ),
      )),
    );
  }
}
