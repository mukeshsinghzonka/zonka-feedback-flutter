import 'package:get/get.dart';

class SurveyTimeUnsyncController extends GetxController {
  Map<String, DateTime> _surveyLastSyncTime = {};
  Map<String, DateTime> get surveyLastSyncTime => _surveyLastSyncTime;
  void setSurveyLastSync(String key, DateTime value) {
    print("setsurveyupdate $key $value"); 
    _surveyLastSyncTime[key] = value;
    update();
  }
}
