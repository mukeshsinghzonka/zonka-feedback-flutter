

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/animation/translate_animation_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/exit_widget.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/screen_show_question_widget.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/screen_switch_widget.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class SurveyShowQuestionScreenWidget extends StatefulWidget {
  const SurveyShowQuestionScreenWidget({super.key});

  @override
  State<SurveyShowQuestionScreenWidget> createState() => _SurveyShowQuestionScreenWidgetState();
}

class _SurveyShowQuestionScreenWidgetState extends State<SurveyShowQuestionScreenWidget>  {
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  final SurveyScreenManager surveyScreenManager = Get.find<SurveyScreenManager>();
  final SurveryApiFeedbackController surveryFeedbackApiController = Get.find<SurveryApiFeedbackController>();
  final TranslateAnimationController translateAnimationController = Get.find<TranslateAnimationController>();
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(       
      decoration: BoxDecoration(
      image: DecorationImage(
          onError: (exception, stackTrace) {},
          fit: BoxFit.cover,
          image: NetworkImage(surveyFieldController.surveyBgImage.value)),
          color: HexColor(surveyFieldController.surveyBgColor.value),
      ),
        child: Column(
          children: [
            const Expanded(flex: 7, child: ScreenSwitchWidget()),
            Obx(() {
              return Expanded(
                flex: 29,
                child: Container(      
                  decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                  child: SwitchScreenWidget(
                    feedbackQuestion: surveryFeedbackApiController.surveyModel.value.surveyScreens[surveyScreenManager.index.value].fields,
                    index: surveyScreenManager.index.value,
                  ),   
                ),
              );
            }),
         
          const Expanded(flex: 3, child: ExitWidget())
          ],
        )
      );
  }
}