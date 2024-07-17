import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';

class SurveyCollectDataController extends GetxController{
  final SurveryApiFeedbackController screenFeedbackController = Get.find<SurveryApiFeedbackController>();

  RxMap<String, dynamic> surveyIndexData = <String, dynamic>{}.obs;

  void updateSurveyData({required String quesId, required dynamic value}){
    surveyIndexData[quesId] = value;
    update();
  }

  bool checkDisplayLogic({required String quesId, required String type}){
    dynamic data = surveyIndexData[quesId];
    switch (type) {
       case 'mcqquestion':
       return false;
        default:
        return false;
    }
  
  }






}