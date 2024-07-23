import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';

class SurveyCollectDataController extends GetxController{
  final SurveryApiFeedbackController screenFeedbackController = Get.find<SurveryApiFeedbackController>();

  RxMap<String, dynamic> surveyIndexData = <String, dynamic>{}.obs;

  void updateSurveyData({required String quesId, required dynamic value}){
    surveyIndexData[quesId] = value;
    update();
  }


  bool checkIfChoiceSelected(String  fieldId, String fieldName, String choiceId) {
    dynamic selectedData = surveyIndexData[fieldId];
    switch (fieldName) {
      case "msqquestion":
        Map<String, bool> choiceMap = Map<String, bool>.from(selectedData);
        bool choiceMapVal = choiceMap.containsKey(choiceId);
        if (choiceMapVal) {
          return choiceMap[choiceId] ?? false;
        }
        return true;
      case "radio":
        return false;
      case "checkbox":
        Map<String, bool> choiceMap = Map<String, bool>.from(selectedData);
        bool choiceMapVal = choiceMap.containsKey(choiceId);
        if (choiceMapVal) {
          return choiceMap[choiceId] ?? false;
        }
        return false;
      default:
        return false;
    }
  }



}