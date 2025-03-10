import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/choice_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/display_logic_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_reponse_model.dart';
import 'package:zonka_feedback/feedback/domain/entity/rating_data_collector.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';

import '../../data/data_model_new/server_name.dart';

class SurveyCollectDataController extends GetxController {
  final SurveryApiFeedbackController screenFeedbackController = Get.find<SurveryApiFeedbackController>();
  RxMap<String, dynamic> surveyIndexData = <String, dynamic>{}.obs;

  void updateSurveyData({required String quesId, required dynamic value}) {
    surveyIndexData[quesId] = value;
    update();
  }

  dynamic createDataForApiHit(String fieldId, String fieldName) {
    dynamic selectedData = surveyIndexData[fieldId];
    print("createDataForApiHit $selectedData $fieldId $fieldName");
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
                fieldName: fieldName
              ),
            );
          }
        });
        return valueList;
      case "radio":
        if (selectedData is String?) {
          String? radioButtonChoiceId = selectedData;
          return SurveyResponse(
            fieldId: fieldId,
            choiceId: radioButtonChoiceId,
              fieldName: fieldName
          );
        } else if (selectedData is Map<String, dynamic>?) {
          Map<String, bool>? choiceMap = Map<String, bool>.from(selectedData ?? {});
          List<SurveyResponse> valueList = [];
          choiceMap.forEach((choiceId, isSelected) {
            if (isSelected) {
              valueList.add(
                SurveyResponse(
                  fieldId: fieldId,
                  choiceId: choiceId,
                    fieldName: fieldName
                ),
              );
            }
          });
        }
      case "text_box" || 'Email' || 'MembershipNo' || 'FullName' || 'FirstName' || 'Name':
        String? textValue = selectedData as String?;
        return SurveyResponse(fieldId: fieldId, fieldValue: textValue,  fieldName: fieldName);

      case "txtComments":
        String? textValue = selectedData as String?;
        return SurveyResponse(fieldId: fieldId, fieldValue: textValue,  fieldName: fieldName);
      case "date":
        DateTime? dateValue = selectedData as DateTime?;
        DateFormat formattedDate = DateFormat('yyyy-MM-dd');
        return SurveyResponse(fieldId: fieldId, fieldValue: dateValue == null? "" :formattedDate.format(dateValue).toString(),  fieldName: fieldName);

      case "npsquestion" || "cssquestion" || "button_rating" || "legalTerm":
        Choice? choiceId = selectedData as Choice?;
        return SurveyResponse(fieldId: fieldId, choiceId:choiceId==null? "" : choiceId.id, fieldName: fieldName);

      case "heart_rating" ||  "circle_rating" || "star_rating" || "emotion_rating":
        Map<String, String> choiceMap = (selectedData as RatingDataCollector?)?.choiceMap ?? {};
        List<SurveyResponse> valueList = [];
        choiceMap.forEach((optionId, choiceId) {
          valueList.add(
            SurveyResponse(
                fieldId: fieldId, choiceId: choiceId, optionId: optionId,  fieldName: fieldName),
          );
        });
        return valueList;

      case "dropdown":
        Choice? dropDownValue = selectedData as Choice?;
        return SurveyResponse(
          fieldId: fieldId,
          fieldName: fieldName,
          choiceId:dropDownValue==null?"": dropDownValue.id,
        );

      case "RankingQuestion":
        List<Choice> items = List<Choice>.from(selectedData);

        // Using map to create a new list from items
        List<SurveyResponse> valueList = items.map((e) {
          return SurveyResponse(
            choiceId: e.id,
            fieldId: fieldId,
            fieldName: fieldName,
            fieldValue: ((e.choiceWeight ?? 0) + 1).toString(),
          );
        }).toList(); // Convert the iterable from map to a List
        // Return the valueList after processing
        return valueList;

      case "Mobile":
        String? phoneNumber  = selectedData as String?;
        return SurveyResponse(
          fieldId: fieldId,
          fieldValue: phoneNumber??"",
            fieldName: fieldName
        );

      case "ServerName":
        ServerNameModel ? serverNameModel  = selectedData as ServerNameModel?;
        return SurveyResponse(
          fieldId: fieldId,
          fieldValue: serverNameModel?.userId??"",
          takenBy: serverNameModel?.userId??"",
            fieldName: fieldName
        );

      default:
    }
    return null;
  }

  bool checkIfDisplayConditionMatched(DisplayLogicModel displayModel, String fieldName) {
    dynamic selectedData = surveyIndexData[displayModel.fieldId];
    print("selectedata $selectedData");
    if(selectedData==null){
      return false;
    }
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
          Map<String, bool>? choiceMap = Map<String, bool>.from(selectedData ?? {});
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
        Choice? choiceId = selectedData as Choice?;
        if(choiceId == null){
          return false;
        }
        return  choiceId.id == displayModel.choiceId;
      case "heart_rating" || "circle_rating" || "star_rating" || "emotion_rating":
        Map<String, String> choiceMap =
            (selectedData as RatingDataCollector?)?.choiceMap ?? {};
        return choiceMap.containsValue(displayModel.choiceId);
      case "dropdown":
        Choice? dropDownValue = selectedData as Choice?;
          if(dropDownValue == null){
          return false;
        }
        return dropDownValue.choiceNodeId == displayModel.choiceId;

      case "Mobile":
        String ? phoneNumber = selectedData as String?;
        switch (displayModel.actionTaken) {
          case "FL":
            return phoneNumber != null;
          case "NF":
            return phoneNumber == null;
        }
        return false;


      default:
        return false;
    }
  }
}
