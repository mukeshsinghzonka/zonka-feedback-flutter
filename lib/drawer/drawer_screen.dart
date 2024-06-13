
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 65.h,
              margin: EdgeInsets.only(right: 100.w),
              padding: EdgeInsets.only(
                  right: 60.w, left: 13.w, top: 15.h, bottom: 12.h),
              child: SvgPicture.asset(
                ImageConstant.zonkaDrawerLogo,
                fit: BoxFit.fill,
              ),
            ),
            const Divider(),
            ListTile(
              title: Row(
                children: [
                  SvgPicture.asset(
                    ImageConstant.drawerSurveyIcon,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Text('Surveys'),
                ],
              ),
              onTap: null,
            ),
            ListTile(
              title: Row(
                children: [
                  SvgPicture.asset(
                    ImageConstant.drawerSettingIcon,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Text('Settings'),
                ],
              ),
              onTap: null,
            ),
            ListTile(
              title: Row(
                children: [
                  SvgPicture.asset(
                    ImageConstant.drawerSendFeedBackIcon,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Text('Send feedback'),
                ],
              ),
              onTap: null,
            ),
            ListTile(
              title: Row(
                children: [
                  SvgPicture.asset(
                    ImageConstant.drawerHelpIcon,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Text('Help'),
                ],
              ),
              onTap: null,
            ),
            ListTile(
              title: Row(
                children: [
                  SvgPicture.asset(
                    ImageConstant.drawerHeadPhoneIcons,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Text('Request For Demo'),
                ],
              ),
              onTap: null,
            ),
            ListTile(
              title: Row(
                children: [
                  SvgPicture.asset(
                    ImageConstant.drawerWebLoginIcon,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Text('Web Log In'),
                ],
              ),
              onTap: null,
            ),
          ],
        ),
      );
  }
}