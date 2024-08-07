import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/choice_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/display_logic_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/logic_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/survey_screen_model.dart';
import 'package:zonka_feedback/feedback/domain/entity/form_validator.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';

class SurveyScreenManager extends GetxController {
  final SurveryApiFeedbackController screenFeedbackController = Get.find<SurveryApiFeedbackController>();
  final SurveyCollectDataController surveyCollectDataController = Get.put(SurveyCollectDataController());
  final RxBool _nextScreenstop = false.obs;
  RxBool get nextScreenstop => _nextScreenstop;

  final RxInt _index = 0.obs;
  RxInt get index => _index;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  RxMap<String, FormValidator>? showIsRequired = <String, FormValidator>{}.obs;

  Map<String, int> mapSurveyQuesIdIndex = {};
  Map<String, String> mapSurveyIdAndFieldName = {};
  Map<String, bool> visibeSurveyWidget = {};
  List<int> surveyIndex = [0];

  List<SurveyScreenModel> surveyScreens = [];

  @override
  void onInit() {
    super.onInit();
    surveyScreens = screenFeedbackController.surveyModel.value.surveyScreens;
    _initalizeMapSurveyQuesIdIndex();
  }

  void _initalizeMapSurveyQuesIdIndex() {
    for (int i = 0; i < surveyScreens.length; i++) {
      for (int j = 0; j < surveyScreens[i].fields.length; j++) {
        Field field = surveyScreens[i].fields[j];
        mapSurveyQuesIdIndex[field.id ?? ""] = i;
        mapSurveyIdAndFieldName[field.id ?? ""] = field.fieldName ?? "";
      }
    }
  }

  Map<int, bool> _displayLogicExpression(Field field) {
    List<DisplayLogicModel> displayLogic = field.displayLogic;
    Map<int, bool> displayLogicMap = {};

    for (int i = 0; i < displayLogic.length; i++) {
      DisplayLogicModel displayLogicModel = displayLogic[i];
      bool value = surveyCollectDataController.checkIfDisplayConditionMatched(displayLogicModel,mapSurveyIdAndFieldName[displayLogicModel.fieldId] ?? "");
      switch (displayLogicModel.actionTaken) {
        case 'SL' ||'NL' || 'EQ' || 'FL' || 'NF' || 'NEQ':
          displayLogicMap[displayLogicModel.sequence!] = value;
          break;
      }
    }

    return displayLogicMap;
  }

  bool evaluateExpression(List<String> expression) {
    // Step 1: Evaluate '&&' operations
    for (int i = 0; i < expression.length; i++) {
      if (expression[i] == 'and') {
        bool left = bool.parse(expression[i - 1]);
        bool right = bool.parse(expression[i + 1]);
        bool result = (left && right);
        // Replace the three elements with the result
        expression.replaceRange(i - 1, i + 2, [result.toString()]);
        i--; // Move back the index as the list has shrunk
      }
    }

    // Step 2: Evaluate '||' operations
    for (int i = 0; i < expression.length; i++) {
      if (expression[i] == 'or') {
        bool left = bool.parse(expression[i - 1]);
        bool right = bool.parse(expression[i + 1]);
        bool result = left || right;
        // Replace the three elements with the result
        expression.replaceRange(i - 1, i + 2, [result.toString()]);
        i--; // Move back the index as the list has shrunk
      }
    }

    return expression.isNotEmpty ? bool.parse(expression.single) : true;
  }

  List<String> _getListOfTrueFalse(String displayLogicExpression, Map<int, bool> checkHideMap) {
    List<String> tokens = displayLogicExpression.split(' ');
    for (int i = 0; i < tokens.length; i++) {
      if (tokens[i] == "and" || tokens[i] == 'or' || tokens[i] == "") {
        continue;
      }
      bool ansCheck = checkHideMap.containsKey(int.parse(tokens[i]));
      if (ansCheck) {
        tokens[i] = checkHideMap[int.parse(tokens[i])]!.toString();
      } else {
        if (i > 0 && tokens[i - 1] == "and") {
          tokens[i] = "true";
        } else if (i > 0 && tokens[i - 1] == "or") {
          tokens[i] = "false";
        }
      }
    }

    return tokens;
  }

  bool _checkDisplayLogic(bool screenSkipped, String? quesId) {
    for (int j = screenSkipped ? mapSurveyQuesIdIndex[quesId] ?? index.value + 1 : index.value + 1; j < surveyScreens.length; j++) {
      bool checkBreak = false;
      int fieldLength = surveyScreens[j].fields.length;
      for (int i = 0; i < fieldLength; i++) {
        //check display logic
        Field field = surveyScreens[j].fields[i];
      
        Map<int, bool> checkHideMap = _displayLogicExpression(field);
        List<String> listTrueandFalse = field.displayLogicExpression!.isNotEmpty? _getListOfTrueFalse(field.displayLogicExpression ?? "", checkHideMap) : [];
        bool checkHide = listTrueandFalse.isNotEmpty? evaluateExpression(listTrueandFalse): false; 
        // hidesurvey map to keep track of the fields that are hidden
        // checkHide check if widget have to be hidden or not
        // if checkhide is false then it means widget is visible and thus we make visbleSurveyWidget[field.id] = true
        // and if checkHide is true then we make visbleSurveyWidget[field.id] = false becuase we have to make widget invisble
        visibeSurveyWidget[field.id ?? ""] = checkHide == false ? true :false;
        if (checkHide == false) {
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

  String? _skipAndRedirect() {
    int fieldLength = surveyScreens[_index.value].fields.length;
    List<Field> fields = surveyScreens[_index.value].fields;

    for (int i = fieldLength - 1; i >= 0; i--) {


      // check if question is skipped for textbox and date only
      if (fields[i].fieldName == 'text_box' || fields[i].fieldName == 'date') {
        Logic? logicChoice = fields[i].logic;
        switch (logicChoice!.skipHideRedirectTo) {
          case "skipTo":
            switch (logicChoice.actionTaken) {
              case "NB":
                return logicChoice.skipToScreenOrQuestion;
            }
            break;
        }
      }

      // check if question is escaped
      List<Choice> choice = fields[i].choices;
      //Escape Question
      for (int j = choice.length - 1; j >= 0; j--) {
        if (surveyCollectDataController.checkIfDisplayConditionMatched(DisplayLogicModel(fieldId: fields[i].id, actionTaken: choice[j].logic?.actionTaken ?? "",choiceId: choice[j].id ?? "",),
          fields[i].fieldName ?? "",
        )) {
          Logic? logicChoice = choice[j].logic;
          if (logicChoice?.actionTaken == "EQ") {
            return logicChoice?.skipToScreenOrQuestion;
          }
        }
      }
    }
    return null;
  }

  bool _checkValidationOnNext() {
    bool showNextPage = true;
    showIsRequired!.clear(); // Clear the observable map
    var validationResults = _formKey.currentState!.validateGranularly();
    for (var validationResult in validationResults) {
      String? errorText = validationResult.errorText;
      if (errorText != null && errorText.isNotEmpty) {
        FormValidator? formValidator = FormValidator.fromJson(jsonDecode(errorText));
        showIsRequired?[formValidator.formId] = formValidator;
        showNextPage = false;
      }
    }
    return showNextPage;
  }

  void nextScreen() {
    if (_index.value == surveyScreens.length ) {
      //show exit screen
      print("exitscreen");
      return;
    }

    if (_checkValidationOnNext()) {
      String? questionEscaped = _skipAndRedirect();
      bool valueIsSet = _checkDisplayLogic(
          questionEscaped == null ? false : true, questionEscaped);
      if (!valueIsSet) {
        // show exit screen of the survey
      }
    }
    //check display logic only then increase index to next screen
  }

  void previousScreen() {
    if (surveyIndex.isNotEmpty && surveyIndex.length > 1) {
      _index.value = surveyIndex[surveyIndex.length - 2];
      showIsRequired!.clear();
      if (surveyIndex.last != 0) surveyIndex.removeLast();
    }
    else{
      //show intro screen
    }
  }
}
