import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';
import 'package:zonka_feedback/utils/logic_file.dart';

class ScreenSwitchWidget extends StatefulWidget {
  const ScreenSwitchWidget({super.key});

  @override
  State<ScreenSwitchWidget> createState() => _ScreenSwitchWidgetState();
}

class _ScreenSwitchWidgetState extends State<ScreenSwitchWidget> with SingleTickerProviderStateMixin {
  final SurveyScreenManager surveyScreenManager = Get.find<SurveyScreenManager>();
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
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
                 width: 35.h,
                  padding: EdgeInsets.all(2.w),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top:40.h,left: 5.w),
                  decoration: BoxDecoration(
                    color: HexColor(surveyFieldController.buttonColor.value),
                    shape: BoxShape.circle,

                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: HexColor(LogicFile().getContrastColor(surveyFieldController.optionTextColor.value)), 
                    size: 10.h,
                  )),
            ),
            Image.network(
              surveyFieldController.surveyBgImageLogo.value,
              errorBuilder: (context, error, stackTrace) {
                return Container();
              },
            ),
            Obx(
               () {
                return GestureDetector(
                  onTap: () async {
                    if (surveyScreenManager.nextScreenstop.value == false) {
                      surveyScreenManager.nextScreen();
                    }
              
                  },
                  child: Container(      
                      width: 35.h,
                      padding: EdgeInsets.all(2.w),
                      margin: EdgeInsets.only(top:40.h,right: 5.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: HexColor(surveyFieldController.buttonColor.value),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color:  HexColor(LogicFile().getContrastColor(surveyFieldController.optionTextColor.value)),
                        size: 10.h,
                      )),
                );
              }
            )
          ],
        );
    
  }
}
