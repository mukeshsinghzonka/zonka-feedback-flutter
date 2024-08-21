import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

           Visibility(
            visible: surveyScreenManager.screenTypeEnumUtil != ScreenTypeEnumUtil.languageScreen ,
             child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: HexColor(surveyFieldController.buttonColor.value),),
                    child:  Text(
                      surveyFieldController.defaultTranslation.value.split('_')[1],
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontFamily: surveyFieldController.fontFamily.value),
                    ),
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
        Builder(
          builder: (context) {

            return GestureDetector(
              onTap: () {
              Navigator.of(context).pop();
               Get.delete<SurveyScreenManager>();
               surveyScreenManager.myStreamController!.close();
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
                    style: TextStyle(color: Colors.white, fontFamily: surveyFieldController.fontFamily.value),
                  ),
                ),
              ),
            );
          }
        ),
      ],
    );
  }
}
