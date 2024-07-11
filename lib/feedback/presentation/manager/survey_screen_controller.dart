import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_feedback_controller.dart';
import 'package:zonka_feedback/utils/enum_util.dart';


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

 late final Rx<SurveyScreenenum> _surveyScreenenum = Rx<SurveyScreenenum>(SurveyScreenenum.welcomeWidget);
  Rx<SurveyScreenenum>  get surveyScreenenum => _surveyScreenenum;

  void setSurveyScreenenum(SurveyScreenenum surveyScreenenum) {
    _surveyScreenenum.value = surveyScreenenum;
    update();
  }


  
}
