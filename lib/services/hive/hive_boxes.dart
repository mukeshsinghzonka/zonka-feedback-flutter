
import 'package:hive/hive.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';

class Boxes {
  static Map<String, Box> allBoxes = {
    'loginBox': Hive.box(HiveDirectoryUtil.loginBox),
    'locationBox': Hive.box(HiveDirectoryUtil.locationBox),
    'submitSurveyBox':Hive.box(HiveDirectoryUtil.submitSurveyBox)
    // Add more boxes as needed
  };
}