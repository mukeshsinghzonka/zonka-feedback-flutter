import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';

Future<void> openHiveBox() async {
   await HiveService().openBox(HiveDirectoryUtil.loginBox);
   await HiveService().openBox(HiveDirectoryUtil.locationBox);
   await HiveService().openBox(HiveDirectoryUtil.submitSurveyBox);
   await HiveService().openBox(HiveDirectoryUtil.failedSurveyBox);
   await HiveService().openBox(HiveDirectoryUtil.totalSurveySubmitResponse);
   await HiveService().openBox(HiveDirectoryUtil.surveyResModelBox);
   await HiveService().openBox(HiveDirectoryUtil.workSpaceModelBox);
   await HiveService().openBox(HiveDirectoryUtil.surveyDownloadResponseBox);
   
}