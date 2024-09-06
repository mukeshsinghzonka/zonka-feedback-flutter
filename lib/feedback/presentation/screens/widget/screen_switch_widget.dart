import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
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
           
            Stack(
              children: [
                 Obx(
                () {
                   if(ScreenTypeEnumUtil.languageScreen == surveyScreenManager.screenTypeEnumUtil.value || ScreenTypeEnumUtil.exitScreen == surveyScreenManager.screenTypeEnumUtil.value){
                       return Container();
                   }
                                  
                   return Visibility(
                     visible:surveyScreenManager.index.value!=0?false: (surveyFieldController.languagePickView.value == "both" ||
                   surveyFieldController.languagePickView.value == "button" ) ? surveyFieldController.switchLanguageScreenDisplay.value=="both"?true:
                   (surveyFieldController.switchLanguageScreenDisplay.value=="intro" && 
                   surveyScreenManager.screenTypeEnumUtil.value == ScreenTypeEnumUtil.welcomScreen)?
                   true:false:false,
                       child: GestureDetector(
                       onTap: () {
                         surveyScreenManager.setScreenTypeEnum(ScreenTypeEnumUtil.languageScreen);
                       },
                        child: Container(
                           width: 35.h,
                          
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top:40.h,left: 5.w),
                           
                              //  alignment: Alignment.center,
                               decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               color: HexColor(surveyFieldController.buttonColor.value),),
                               child:  Text(
                                 surveyFieldController.defaultTranslation.value.split('_')[1],
                                 textAlign: TextAlign.center,
                                 style: TextStyle(color:  HexColor(LogicFile().getContrastColor(surveyFieldController.buttonColor.value)), fontFamily: surveyFieldController.fontFamily.value,fontSize:5.sp),
                               ),
                             ),
                                        ),
                     );
                   }
                
              
             ),
                Obx(
                   () {
                    return Visibility(
                        visible: surveyScreenManager.index.value!=0,
                      child: GestureDetector(
                        onTap: () {
                          surveyScreenManager.previousScreen();
                        },
                        child: Container(
                           width: 30.h,
                          
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top:40.h,left: 5.w),
                            decoration: BoxDecoration(
                              color: HexColor(surveyFieldController.buttonColor.value),
                              shape: BoxShape.circle,
                      
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new_sharp,
                              color: HexColor(LogicFile().getContrastColor(surveyFieldController.buttonColor.value)), 
                              size: 18.h,
                              weight: 20.sp,
                            )),
                      ),
                    );
                  }
                ),
              ],
            ),
            Image.network(
              surveyFieldController.surveyBgImageLogo.value,
              errorBuilder: (context, error, stackTrace) {
                return Container();
              },
            ),
            Obx(
               () {
                
                    if(surveyScreenManager.index.value ==surveyScreenManager.surveyScreens.length-1 ){
return  GestureDetector(
onTap: () {
       if (surveyScreenManager.nextScreenstop.value == false) {
                      surveyScreenManager.nextScreen();
                    }
},
  child: Container(
    height: 35.h,
    margin: EdgeInsets.only(top:40.h,right: 5.w),
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    alignment: Alignment.center,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(5.r)),
    color: HexColor(surveyFieldController.buttonColor.value),),
    child:  Text(
      'Done',
      textAlign: TextAlign.center,
      style: TextStyle(color:  HexColor(LogicFile().getContrastColor(surveyFieldController.buttonColor.value)), fontFamily: surveyFieldController.fontFamily.value),
    ),
  ),
);
                    }
                return GestureDetector(
                  onTap: () async {
                    if (surveyScreenManager.nextScreenstop.value == false) {
                      surveyScreenManager.nextScreen();
                    }
                              
                  },
                  child: Container(      
                      width: 30.h,
                 
                      margin: EdgeInsets.only(top:40.h,right: 5.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: HexColor(surveyFieldController.buttonColor.value),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color:  HexColor(LogicFile().getContrastColor(surveyFieldController.buttonColor.value)),
                        size: 18.h,
                    weight: 20.sp,
                      )),
                );
              }
            )
          ],
        );
    
  }
}
