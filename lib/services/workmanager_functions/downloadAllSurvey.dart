
import 'package:hive/hive.dart';
import 'package:workmanager/workmanager.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_submit_uc.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';




Future<void> downloadAllSurvey(Map<String, dynamic>? value) async {
  await HiveService().init();
  setup();
  try {
    dynamic surveyIdList = value!['surveyIdList'];
    print("surveylistd $surveyIdList");
  } catch (e) {
    print("Error processing survey");
  }
}