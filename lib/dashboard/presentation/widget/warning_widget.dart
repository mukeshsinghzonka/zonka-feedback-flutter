import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/login/presentation/manager/logout_controller.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';

class WarningWidget extends StatelessWidget {
   WarningWidget({super.key});
final LogoutController  _logoutController = LogoutController();

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        _logoutController.call();
      },
      child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                color: const Color(ColorConstant.redColorExpire),
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your free trial expires in 3 days. ',
                      style: TextStyle(color: Colors.red,fontSize: ConstantSize.extra_small_3.sp),
                    ),
                    Text(
                      'Tap here to Uprade',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: ConstantSize.extra_small_3.sp,
                          decorationColor: Color(ColorConstant.themeColor),
                          color: Color(ColorConstant.themeColor)),
                    ),
                  ],
                )),
    );
  }
}