import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';

class WarningWidget extends StatelessWidget {
  const WarningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        print("clearhivedata");
                HiveService().clearBox(HiveDirectoryUtil.loginBox);
      },
      child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                     height: 30.h,
                color: const Color(ColorConstant.redColorExpire),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your free trial expires in 3 days. ',
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      'Tap here to Uprade',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Color(ColorConstant.themeColor),
                          color: Color(ColorConstant.themeColor)),
                    ),
                  ],
                )),
    );
  }
}