import 'package:aad_oauth/model/token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/microsoft_auth.dart/microsoft_service.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';
import 'package:zonka_feedback/utils/image_constant.dart';
import 'dart:developer';

class OtherLoginWidget extends StatefulWidget {
  const OtherLoginWidget({super.key});

  @override
  State<OtherLoginWidget> createState() => _OtherLoginWidgetState();
}

class _OtherLoginWidgetState extends State<OtherLoginWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          GestureDetector(
            onTap: () async {
            Token ? microsoftLogin = await  MicroSoftService().login();
             await  HiveService().putData(HiveDirectoryUtil.surveyDownloadResponseBox,HiveKey.surveyDownloadedBool,false);
            log('microsoftLogin: $microsoftLogin');
            // dev.log("microsoftlogin ${microsoftLogin?.toMap()}");
            // logger.d("Debug log");
            // getIt<LoggerService>().logDebug("microsoftlogin ${microsoftLogin?.toMap()}");
          },
            child: Container(
              width: 330.w,
              height: 33.h,
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
                  Text('Sign in with Microsoft',style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10.h),)
                ],
              ),
            ),
          ),
        
        ],
      );
    
  }
}