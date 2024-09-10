import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/setting/presentation/widget/app_version_widget.dart';
import 'package:zonka_feedback/setting/presentation/widget/country_code_widget.dart';
import 'package:zonka_feedback/setting/presentation/widget/kiosk_mode_setting_widget.dart';
import 'package:zonka_feedback/setting/presentation/widget/location_widget.dart';
import 'package:zonka_feedback/setting/presentation/widget/preview_survey.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
 
 


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(5.w),
        child: Column(
          children: [
           const  LocationWidgetSetting(),
            SizedBox(
              height: size.height / 30,
            ),
           const CountryCodeWidget(),
            SizedBox(
              height: size.height / 30,
            ),
            const PreViewSurveyWidget(),
            SizedBox(
              height: size.height / 30,
            ),
            const KioskModeSettingWidget(),
            
              SizedBox(
              height: size.height / 30,
            ),
            const AppVersionWidget(),
                
              SizedBox(
              height: size.height / 10,
            ),
          ],
        ),
      ),
    );
  }
}
