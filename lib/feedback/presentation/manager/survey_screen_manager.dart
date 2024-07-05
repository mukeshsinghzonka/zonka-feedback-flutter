import 'package:get/get.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class SurveyScreenManager extends GetxController {
  late SurveyScreenenum _surveyScreenenum = SurveyScreenenum.welcomeWidget;
  SurveyScreenenum get surveyScreenenum => _surveyScreenenum;

  void setSurveyScreenenum(SurveyScreenenum surveyScreenenum) {
    _surveyScreenenum = surveyScreenenum;
    update();
  }

  int _index = 0;

  void nextScreen() {
    if (_index == SurveyScreenenum.values.length - 1) {
      _index = 0;
    } else {
      setSurveyScreenenum(SurveyScreenenum.values[_index]);
      _index++;
    }
  }

  void previousScreen() {
    if (_index <= 0) {
      _index = 0;
    } else {
      _index--;
      setSurveyScreenenum(SurveyScreenenum.values[_index]);
    }
  }
}
