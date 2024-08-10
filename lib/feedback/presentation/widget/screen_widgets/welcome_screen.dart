import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/intro_page_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class WelcomeWidget extends StatefulWidget {
  final IntroPage ? introPage;
  const WelcomeWidget({super.key, required this.introPage});

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(    
      image: DecorationImage(
          onError: (exception, stackTrace) {},
          fit: BoxFit.cover,
          image: NetworkImage(surveyFieldController.introBgImageUrl.value),),
          color: HexColor(widget.introPage?.pageBgColor??""),
      ),
      child: Column(
   
        children: [
   SizedBox(
    height: 100.h,
     child: Image.network(
                surveyFieldController.introLogoImageUrlLogo.value,
                errorBuilder: (context, error, stackTrace) {
                  return Container();
                },
              ),
   ),
      SizedBox(height: 100.h,),
      Text(widget.introPage!.translations![surveyFieldController.defaultTranslation.value]?.upperText??"", style: TextStyle(color: HexColor(widget.introPage?.fontColorUpperText??""))),
      SizedBox(height: 30.h,),
          Center(
            child: Container(
              height: 40.h,
              width: 80.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.r),
                color: HexColor(widget.introPage!.bgColorGetStartButton??""),
              ),
              child:  Text(widget.introPage!.translations![surveyFieldController.defaultTranslation.value]?.getStarted??"", style: TextStyle(color: HexColor(widget.introPage?.fontColorGetStartButton??""))),
            ),
          ),
          SizedBox(height: 30.h,),
         Text(widget.introPage!.translations![surveyFieldController.defaultTranslation.value]?.bottomText??"", style: TextStyle(color: HexColor(widget.introPage?.fontColorBottomText??""))),
        ],
      ),
    );
  }
}
