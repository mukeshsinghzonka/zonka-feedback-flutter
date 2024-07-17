import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/domain/entity/form_validator.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class SurveyScreenManager extends GetxController {
  final SurveryApiFeedbackController screenFeedbackController = Get.find<SurveryApiFeedbackController>();
  final SurveyCollectDataController surveyCollectDataController = Get.put(SurveyCollectDataController());
  final RxBool _nextScreenstop = false.obs;
  RxBool get nextScreenstop => _nextScreenstop;

  final RxInt _index = 0.obs;
  RxInt get index => _index;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  RxMap<String,ScreenValidationErrorType>?  showIsRequired = <String, ScreenValidationErrorType>{}.obs;

  Map<String, int> mapSurveyQuesIdIndex = {};
  Map<String, bool> hideSurveyWidget = {};
  List<int> surveyIndex = [0];
 
  @override
  void onInit() {
    super.onInit();
    _initalizeMapSurveyQuesIdIndex();
  }

bool _checkValidationOnNext() {
  bool showNextPage = true;
  showIsRequired!.clear(); // Clear the observable map

  var validationResults = _formKey.currentState!.validateGranularly();
  
  for (var validationResult in validationResults) {
    String? errorText = validationResult.errorText;
    print("errorText$errorText");

    if (errorText != null && errorText.isNotEmpty) {
      FormValidator formValidator = FormValidator.fromJson(jsonDecode(errorText));
      showIsRequired?[formValidator.formId] = formValidator.value;
      showNextPage = false;
    }
  }

  return showNextPage;
}

  bool _checkDisplayLogic(){
    int fieldLength = screenFeedbackController.surveyModel.value.surveyScreens[_index.value + 1].fields.length;
    int surveyScreenLength = screenFeedbackController.surveyModel.value.surveyScreens.length;
    for (int j = index.value + 1; j < surveyScreenLength; j++) {
      bool checkBreak = false;
      for (int i = 0; i < fieldLength; i++) {
        //check display logic
        Field field = screenFeedbackController.surveyModel.value.surveyScreens[j].fields[i];
        bool hideSurveyQuestionCheck =surveyCollectDataController.checkDisplayLogic(quesId: field.id ?? "", type: field.fieldName ?? "");
        hideSurveyWidget[field.id ?? ""] = hideSurveyQuestionCheck;
        if (hideSurveyQuestionCheck == false) {
          checkBreak = true;
        }
      }
      if (checkBreak) {
        _index.value = j;
        surveyIndex.add(_index.value);
        showIsRequired!.clear();
        return true;
      }
    }
    return false;
  }

  void nextScreen() {
    if (_index.value == screenFeedbackController.surveyModel.value.surveyScreens.length - 1) {
      //show exit screen
      return;   
    }

  if(_checkValidationOnNext()){
   bool valueIsSet = _checkDisplayLogic();
    if (!valueIsSet) {
      // show exit screen of the survey
    }
  }
    //check display logic only then increase index to next screen
 
  
  }

  void previousScreen() {
    if (surveyIndex.isNotEmpty) {
      _index.value = surveyIndex.last;
      showIsRequired!.clear();
      if (surveyIndex.last != 0) surveyIndex.removeLast();
    }
  }




  void _initalizeMapSurveyQuesIdIndex() {
    for (int i = 0; i < screenFeedbackController.surveyModel.value.surveyScreens.length;  i++) {
      for (int j = 0;j < screenFeedbackController.surveyModel.value.surveyScreens[i].fields.length;j++) {
        mapSurveyQuesIdIndex[screenFeedbackController.surveyModel.value.surveyScreens[i].fields[j].id ??""] = i;
      }
    }
  }

  void updateNextScreenIndex({required String quesId}) {
    if (mapSurveyQuesIdIndex.containsKey(quesId)) {
      _index.value = mapSurveyQuesIdIndex[quesId] ?? 0;
      showIsRequired!.clear();
      surveyIndex.add(_index.value);
    }
  }
}
