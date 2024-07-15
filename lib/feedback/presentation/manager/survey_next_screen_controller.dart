import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';

class SurveyScreenManager extends GetxController {
  final SurveryFeedbackController screenFeedbackController =
      Get.find<SurveryFeedbackController>();

  final RxBool _nextScreenstop = false.obs;
  RxBool get nextScreenstop => _nextScreenstop;

  final RxInt _index = 0.obs;
  RxInt get index => _index;

  Map<String, int> mapSurveyQuesIdIndex = {};

  @override
  void onInit() {
    super.onInit();
    _initalizeMapSurveyQuesIdIndex();
  }

  void _initalizeMapSurveyQuesIdIndex() {
    for (int i = 0; i < screenFeedbackController.surveyModel.value.surveyScreens.length;i++) {
      for (int j = 0 ; j <screenFeedbackController.surveyModel.value.surveyScreens[i].fields.length;j++) {
        mapSurveyQuesIdIndex[screenFeedbackController.surveyModel.value.surveyScreens[i].fields[j].id ??""] = i;
      }
    }
  }

  void updateNextScreenIndex({required String quesId}) {
    if (mapSurveyQuesIdIndex.containsKey(quesId)) {
      _index.value = mapSurveyQuesIdIndex[quesId] ?? 0;
    }
  }

  void nextScreen() {
    if (_index.value >= screenFeedbackController.surveyModel.value.surveyScreens.length - 1) {
      _index.value = 0;
    } else {
      _index.value = _index.value + 1;
    }
  }

  void previousScreen() {
    if (_index.value <= 0) {
      _index.value = 0;
    } else {
      _index.value = _index.value - 1;
    }
  }
}
