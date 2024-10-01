import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';

Future<void> openHiveBox() async {
   await Hive.openBox(HiveDirectoryUtil.loginBox);
   await Hive.openBox(HiveDirectoryUtil.locationBox);
   await Hive.openBox(HiveDirectoryUtil.submitSurveyBox);
   await Hive.openBox(HiveDirectoryUtil.failedSurveyBox);
   await Hive.openBox(HiveDirectoryUtil.totalSurveySubmitResponse);
   await Hive.openBox(HiveDirectoryUtil.surveyResModelBox);
   await Hive.openBox(HiveDirectoryUtil.workSpaceModelBox);
   await Hive.openBox(HiveDirectoryUtil.surveyDownloadResponseBox);
   await Hive.openBox(HiveDirectoryUtil.surveyLastSyncDateTime);
   await Hive.openBox(HiveDirectoryUtil.updateHiveSurveyId);
   await Hive.openBox(HiveDirectoryUtil.surveyUnsyncResponseCount);
   await Hive.openBox(HiveDirectoryUtil.totalSurveyResponseCount);
   await Hive.openBox(HiveDirectoryUtil.surveyLastUpdateDateTime);
}