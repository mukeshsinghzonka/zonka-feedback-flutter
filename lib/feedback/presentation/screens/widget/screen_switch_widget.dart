import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_screen_controller.dart';

class ScreenSwitchWidget extends StatefulWidget {
  const ScreenSwitchWidget({super.key});

  @override
  State<ScreenSwitchWidget> createState() => _ScreenSwitchWidgetState();
}

class _ScreenSwitchWidgetState extends State<ScreenSwitchWidget> {
  final SurveyScreenManager surveyScreenManager =
      Get.find<SurveyScreenManager>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            surveyScreenManager.previousScreen();
          },
          child: Container(
              padding: EdgeInsets.all(2.w),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.white,
                size: 15.h,
              )),
        ),
        GestureDetector(
          onTap: () {
            surveyScreenManager.nextScreen();
          },
          child: Container(
              padding: EdgeInsets.all(2.w),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 15.h,
              )),
        )
      ],
    );
  }
}
