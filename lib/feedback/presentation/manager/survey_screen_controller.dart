import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/button_choice_widget.dart';
import 'package:zonka_feedback/utils/enum_util.dart';


class SurveyScreenManager extends GetxController {
  final SurveryFeedbackController screenFeedbackController = Get.find<SurveryFeedbackController>();
 
  RxInt _index = 0.obs;
  RxInt get index => _index;

  void nextScreen() {
    if (_index.value >= screenFeedbackController.surveyModel.value.surveyScreens.length- 1) {
      _index = 0.obs;
    } else {
      _index++;
    }
  }

  void previousScreen() {
    if (_index.value <= 0) {
      _index = 0.obs;
    } else {
      _index--;
    }
  }



 late final Rx<SurveyScreenenum> _surveyScreenenum = Rx<SurveyScreenenum>(SurveyScreenenum.welcomeWidget);
  Rx<SurveyScreenenum>  get surveyScreenenum => _surveyScreenenum;

  void setSurveyScreenenum(SurveyScreenenum surveyScreenenum) {
    _surveyScreenenum.value = surveyScreenenum;
    update();
  }


  
}
