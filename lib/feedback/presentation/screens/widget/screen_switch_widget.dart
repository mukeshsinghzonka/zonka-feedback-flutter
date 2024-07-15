import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_dynamic_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class ScreenSwitchWidget extends StatefulWidget {
  const ScreenSwitchWidget({super.key});

  @override
  State<ScreenSwitchWidget> createState() => _ScreenSwitchWidgetState();
}

class _ScreenSwitchWidgetState extends State<ScreenSwitchWidget> {
  final SurveyScreenManager surveyScreenManager =
      Get.find<SurveyScreenManager>();

  final SurveyFieldController surveyFieldController =
      Get.find<SurveyFieldController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              surveyScreenManager.previousScreen();
            },
            child: Container(
                padding: EdgeInsets.all(2.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: HexColor(surveyFieldController.buttonColor.value),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                  size: 20.h,
                )),
          ),
          Image.network(
            surveyFieldController.surveyBgImageLogo.value,
            errorBuilder: (context, error, stackTrace) {
              return Container();
            },
          ),
          GestureDetector(
            onTap: () {
              if (surveyScreenManager.nextScreenstop.value == false) {
                surveyScreenManager.nextScreen();
              }
            },
            child: Container(
                padding: EdgeInsets.all(2.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: HexColor(surveyFieldController.buttonColor.value),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20.h,
                )),
          )
        ],
      ),
    );
  }
}
