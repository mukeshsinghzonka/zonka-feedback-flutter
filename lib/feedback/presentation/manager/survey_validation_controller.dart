

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_question_show_controller.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class SurveyValidationController extends GetxController{

  final ScreenFeedBackQuesController _screenFeedBackQuesController = Get.find<ScreenFeedBackQuesController>();
  Map<String,dynamic> value = {};

  final ValueNotifier<List<SurveyScreenenum>> _screenDataNotifier = ValueNotifier([SurveyScreenenum.buttonChoice]);
  ValueNotifier<List<SurveyScreenenum>> get screenDataNotifier => _screenDataNotifier;

  


}