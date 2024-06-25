import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/login/presentation/manager/logout_controller.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';

class WarningWidget extends StatelessWidget {
   WarningWidget({super.key});
final LogoutController  _logoutController = LogoutController();

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        _logoutController.call();
        // print("clearhivedata");
        //         HiveService().clearBox(HiveDirectoryUtil.loginBox);
      },
      child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                     height: 25.h,
                color: const Color(ColorConstant.redColorExpire),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your free trial expires in 3 days. ',
                      style: TextStyle(color: Colors.red,fontSize: ConstantSize.small_2.sp),
                    ),
                    Text(
                      'Tap here to Uprade',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: ConstantSize.small_2.sp,
                          decorationColor: Color(ColorConstant.themeColor),
                          color: Color(ColorConstant.themeColor)),
                    ),
                  ],
                )),
    );
  }
}