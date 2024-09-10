import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/services/device_info/device_info.dart';
import 'package:zonka_feedback/services/dialog_util.dart';
import 'package:zonka_feedback/services/navigator.dart';
import 'package:zonka_feedback/utils/color_constant.dart';

class AppVersionWidget extends StatefulWidget {
  const AppVersionWidget({super.key});

  @override
  State<AppVersionWidget> createState() => _ApVersionWidgetState();
}

class _ApVersionWidgetState extends State<AppVersionWidget> {
  AndroidDeviceInfo androidDeviceInfo = DeviceInfoService().androidInfo;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        width: size.width,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'App Version',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
                Text(
                  'You are currently using version 4.68',
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
                const Text(
                  'A new version is now available. Click here to download.',
                  style: TextStyle(
                    color: Color(
                      ColorConstant.themeColor,
                    ),
                    fontFamily: 'Source Sans Pro',
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.grey.shade200,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Device ID',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
                Text(
                  androidDeviceInfo.id,
                  style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      color: Colors.grey.shade300),
                )
              ],
            ),
            Divider(
              color: Colors.grey.shade200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Send Debugging Data',
                  style:
                      TextStyle(fontFamily: 'Source Sans Pro', fontSize: 12.w),
                ),
                const Text(
                  'Send',
                  style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      color: Color(ColorConstant.themeColor)),
                )
              ],
            ),
            Divider(
              color: Colors.grey.shade200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'You are logged in as  ',
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            color: Colors.black,
                            fontSize: 10.sp),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Andrew Mathew',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                       DialogUtils.showCustomDialogBox(NavigationService.navigatorKey.currentContext!, title: 'Do you really want to sign out?', leftButtonTitle: 'Yes, sign out', rightButtonTitle: 'No don\'t sign out');
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: const Text(
                        'Sign Out',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '(zonaka.test25@gmail.com)',
              style: TextStyle(fontSize: 7.sp),
            )
          ],
        ),
      ),
    );
  }
}
