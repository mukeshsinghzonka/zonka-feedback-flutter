
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/language_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/survey_show_question_screen.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/thank_you_screen.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/welcome_screen.dart';
import 'package:zonka_feedback/utils/enum_util.dart';


class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});
  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final SurveyScreenManager surveyScreenManager = Get.put(SurveyScreenManager());
  final SurveryApiFeedbackController surveryFeedbackController = Get.find<SurveryApiFeedbackController>();
  final SurveyDesignFieldController surveyFieldController = Get.put(SurveyDesignFieldController());
  
  @override
  void initState() {
    surveyFieldController.setFieldFromSurveyModel();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
      return Obx(
        () {
          if(surveyScreenManager.screenTypeEnumUtil.value == ScreenTypeEnumUtil.welcomScreen){
            return WelcomeWidget(introPage:surveryFeedbackController.surveyModel.value.introPage );
          }
          else if(surveyScreenManager.screenTypeEnumUtil.value == ScreenTypeEnumUtil.languageScreen){
            return LanguageWidget(languagePage:surveryFeedbackController.surveyModel.value.languagePage);
          }
          else if(surveyScreenManager.screenTypeEnumUtil.value == ScreenTypeEnumUtil.thankYouScreen){
           return ThankYouWidget(field: surveryFeedbackController.surveyModel.value.thankyouPage);
          }
          return const SurveyShowQuestionScreenWidget();
        }
      );
      
   
  }
}
