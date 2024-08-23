import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/choice_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/display_logic_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_reponse_model.dart';
import 'package:zonka_feedback/feedback/domain/entity/rating_data_collector.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';

class SurveyCollectDataController extends GetxController {
  final SurveryApiFeedbackController screenFeedbackController =
      Get.find<SurveryApiFeedbackController>();

  RxMap<String, dynamic> surveyIndexData = <String, dynamic>{}.obs;

  void updateSurveyData({required String quesId, required dynamic value}) {
    surveyIndexData[quesId] = value;
    update();
  }

  List<SurveyResponse>? createDataForApiHit(String fieldId, String fieldName) {
    dynamic selectedData = surveyIndexData[fieldId];

    switch (fieldName) {
      case "msqquestion" || "checkbox" || "picture_rating" || "mcqquestion":
        Map<String, bool> choiceMap = Map<String, bool>.from(selectedData);
        List<SurveyResponse> valueList = [];

        choiceMap.forEach((choiceId, isSelected) {
          if (isSelected) {
            valueList.add(
              SurveyResponse(
                fieldId: fieldId,
                choiceId: choiceId,
              ),
            );
          }
        });

        return valueList;
      case "radio":
        if (selectedData is String?) {
          String? radioButtonChoiceId = selectedData;
        } else if (selectedData is Map<String, dynamic>?) {
          Map<String, bool>? choiceMap =
              Map<String, bool>.from(selectedData ?? {});
        }

      case "text_box":
        String? textValue = selectedData as String?;
      case "date":
        DateTime? dateValue = selectedData as DateTime?;

      case "npsquestion" || "cssquestion" || "button_rating" || "legalTerm":
        String? choiceId = selectedData as String?;

      case "heart_rating" ||
            "circle_rating" ||
            "star_rating" ||
            'emotion_rating':
        Map<String, String> choiceMap =
            (selectedData as RatingDataCollector?)?.choiceMap ?? {};

      case "dropdown":
        Choice? dropDownValue = selectedData as Choice?;

      default:
    }
    return null;
  }

  bool checkIfDisplayConditionMatched(
      DisplayLogicModel displayModel, String fieldName) {
    dynamic selectedData = surveyIndexData[displayModel.fieldId];
    switch (fieldName) {
      case "msqquestion" || "checkbox" || "picture_rating" || "mcqquestion":
        Map<String, bool> choiceMap = Map<String, bool>.from(selectedData);
        bool choiceMapVal = choiceMap.containsKey(displayModel.choiceId);
        if (choiceMapVal) {
          return choiceMap[displayModel.choiceId] ?? false;
        }
        return true;
      case "radio":
        if (selectedData is String?) {
          String? radioButtonChoiceId = selectedData;
          if (radioButtonChoiceId == displayModel.choiceId) {
            return true;
          }
        } else if (selectedData is Map<String, dynamic>?) {
          Map<String, bool>? choiceMap =
              Map<String, bool>.from(selectedData ?? {});
          bool choiceMapVal = choiceMap.containsKey(displayModel.choiceId);
          if (choiceMapVal) {
            return choiceMap[displayModel.choiceId] ?? false;
          }
        }
        return false;
      case "text_box":
        String? textValue = selectedData as String?;
        switch (displayModel.actionTaken) {
          case "NEQ":
            return textValue != displayModel.refValue;
          case "EQ":
            return textValue == displayModel.refValue;
          case "FL":
            return textValue != null && textValue.isNotEmpty;
          case "NF":
            return textValue != null && textValue.isEmpty;
        }
        return false;

      case "date":
        DateTime? dateValue = selectedData as DateTime?;
        switch (displayModel.actionTaken) {
          case "FL":
            return dateValue != null;
          case "NF":
            return dateValue == null;
        }
        return false;
      case "npsquestion" || "cssquestion" || "button_rating" || "legalTerm":
        String? choiceId = selectedData as String?;
        return choiceId == displayModel.choiceId;
      case "heart_rating" ||
            "circle_rating" ||
            "star_rating" ||
            'emotion_rating':
        Map<String, String> choiceMap =
            (selectedData as RatingDataCollector?)?.choiceMap ?? {};
        return choiceMap.containsValue(displayModel.choiceId);
      case "dropdown":
        Choice? dropDownValue = selectedData as Choice?;
        return dropDownValue?.choiceNodeId == displayModel.choiceId;
      default:
        return false;
    }
  }
}
