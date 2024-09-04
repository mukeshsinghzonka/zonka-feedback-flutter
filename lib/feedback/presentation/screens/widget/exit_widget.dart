import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';
import 'package:zonka_feedback/utils/logic_file.dart';

class ExitWidget extends StatefulWidget {
  const ExitWidget({super.key});

  @override
  State<ExitWidget> createState() => _ExitWidgetState();
}

class _ExitWidgetState extends State<ExitWidget> {
final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
final SurveyScreenManager surveyScreenManager = Get.find<SurveyScreenManager>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height:size.height * 0.08,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    margin: EdgeInsets.all(5.w),
                    alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
             Expanded(
               child: Obx(
                  () {
                   return Visibility(
                    visible: surveyScreenManager.screenTypeEnumUtil.value !=ScreenTypeEnumUtil.welcomScreen&& surveyScreenManager.screenTypeEnumUtil.value !=ScreenTypeEnumUtil.exitScreen && surveyScreenManager.screenTypeEnumUtil.value !=ScreenTypeEnumUtil.languageScreen   ,
                     child: CircularPercentIndicator(
                          radius: 18.r,
                          lineWidth: 5.0,
                          percent: (surveyScreenManager.index.value) /(surveyScreenManager.surveyScreens.length-1),
                          center:  Text("${(((surveyScreenManager.index.value) /(surveyScreenManager.surveyScreens.length-1))*100 ).toInt()}%",style: TextStyle(fontSize: 3.sp,fontWeight: FontWeight.bold,color:  HexColor(surveyFieldController.buttonColor.value)),),
                          progressColor:  HexColor(surveyFieldController.buttonColor.value),
                        ),
                   );
                 }
               ),
             ),
            Expanded(
              flex: 8,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Powered By Zonka FeedBack',
                  style: TextStyle( fontFamily: surveyFieldController.fontFamily.value, fontSize: 6.sp),
                ),
              )),
          Obx(
             () {
              return Visibility(
                visible:  (ScreenTypeEnumUtil.welcomScreen == surveyScreenManager.screenTypeEnumUtil.value && surveyFieldController.showExitButtonOnIntro.value)
                || (surveyScreenManager.screenTypeEnumUtil.value == ScreenTypeEnumUtil.exitScreen && surveyFieldController.showExitButtonONThnkyou.value) ||
                surveyScreenManager.screenTypeEnumUtil.value ==ScreenTypeEnumUtil.surveryScreen
              ,
                child: GestureDetector(
                  onTap: () { 

                    if(surveyScreenManager.screenTypeEnumUtil.value == ScreenTypeEnumUtil.exitScreen){
                        surveyScreenManager.updateScreenTypeUtilFunction();
                    }

                    else if(surveyScreenManager.screenTypeEnumUtil.value == ScreenTypeEnumUtil.welcomScreen){
                      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
                      Navigator.of(context).pop();
                      Get.delete<SurveyScreenManager>();
                      surveyScreenManager.myStreamController!.close();
                    }
                    else if(surveyScreenManager.screenTypeEnumUtil.value == ScreenTypeEnumUtil.languageScreen ){
                      surveyScreenManager.setScreenTypeEnum(ScreenTypeEnumUtil.welcomScreen);
                    }
                   else if(surveyScreenManager.screenTypeEnumUtil.value == ScreenTypeEnumUtil.surveryScreen){
                          surveyScreenManager.updateScreenTypeUtilFunction();
                    }
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child:  Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      color: HexColor(surveyFieldController.buttonColor.value),),
                      child:  Text(
                        'Exit',
                        textAlign: TextAlign.center,
                        style: TextStyle(color:  HexColor(LogicFile().getContrastColor(surveyFieldController.buttonColor.value)), fontFamily: surveyFieldController.fontFamily.value),
                      ),
                    ),
                  ),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
