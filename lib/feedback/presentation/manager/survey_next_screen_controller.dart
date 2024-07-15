import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';


class SurveyScreenManager extends GetxController {
  final SurveryFeedbackController screenFeedbackController = Get.find<SurveryFeedbackController>();
 
  final RxBool _nextScreenstop = false.obs;
  RxBool get nextScreenstop => _nextScreenstop;

  final RxInt _index = 0.obs;
  RxInt get index => _index;

  void nextScreen() {
    if (_index.value >= screenFeedbackController.surveyModel.value.surveyScreens.length- 1) {
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
