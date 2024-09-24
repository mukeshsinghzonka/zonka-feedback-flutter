
import 'dart:ui';
import 'package:hive/hive.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_submit_uc.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';

Future<void> syncAllFailedSurveyReponse() async {
  await HiveService().init();
  setup();
  
  // Open the Hive box
  var box = await Hive.openBox(HiveDirectoryUtil.failedSurveyBox);
  // List<dynamic> boxKeyList = box.keys.toList();
  // Loop from last key to the first

  while (box.values.isNotEmpty) {
    print("syncallFailedsurveys");
    var key = box.keys.toList().length - 1;
     print("failedreponses ${box.keys.toList()} ${key}");
    try {
      var surveyValue = await HiveService().getDataAt(HiveDirectoryUtil.failedSurveyBox, key);
      ApiResult<void> response = await getIt.get<SurveySubmitUc>().call(surveyValue);
      bool checkInternetConnection = true;
      response.when(
        success: (data) {
          HiveService().deleteDataAt(HiveDirectoryUtil.failedSurveyBox, key);
        },
        failure: (error) async {
          surveyValue.failureReason = NetworkExceptions.getErrorMessage(error!);
          if (error == const NetworkExceptions.noInternetConnection()) {
            checkInternetConnection = false;
          }
          await HiveService().deleteDataAt(HiveDirectoryUtil.failedSurveyBox, key);
        },
      );
       
      if (checkInternetConnection == false) {
        break;
      }
    } catch (e) {
      print("Error processing survey with key $key: $e");
    }
  }
}