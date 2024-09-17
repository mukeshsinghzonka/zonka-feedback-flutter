import 'package:hive/hive.dart';

import 'package:zonka_feedback/feedback/domain/usecase/survey_submit_uc.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';


Future<void> syncAllSurveyReponse() async {
  await HiveService().init();
  setup();

  // Open the Hive box
  var box = await Hive.openBox(HiveDirectoryUtil.submitSurveyBox);
  int count = 0;

  while (box.values.isNotEmpty) {
    var key = box.keys.toList().length - 1;
    try {
      var surveyValue =
          await HiveService().getDataAt(HiveDirectoryUtil.submitSurveyBox, key);
      ApiResult<void> response =
          await getIt.get<SurveySubmitUc>().call(surveyValue);
      bool checkInternetConnection = true;
      response.when(
        success: (data) {
          HiveService().deleteDataAt(HiveDirectoryUtil.submitSurveyBox, key);
        },
        failure: (error) async {
          surveyValue.failureReason = NetworkExceptions.getErrorMessage(error!);
          if (error == const NetworkExceptions.noInternetConnection()) {
            checkInternetConnection = false;
          }
          if (count == 3) {
            await HiveService()
                .deleteDataAt(HiveDirectoryUtil.submitSurveyBox, key);
            await HiveService()
                .addData(HiveDirectoryUtil.failedSurveyBox, surveyValue);
            count = 0;
          } else {
            count++;
          }
        },
      );

      if (checkInternetConnection == false) {
        break;
      }
      // ignore: empty_catches
    } catch (e) {}
  }
}
