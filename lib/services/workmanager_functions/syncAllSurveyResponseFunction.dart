import 'dart:ui';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_submit_uc.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_time_unsync_controller.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';

Future<void> syncAllSurveyReponse() async {
  // Now that platform channels are ready, initialize Hive
   if (!Get.isRegistered<SurveyTimeUnsyncController>()) {
    Get.put(SurveyTimeUnsyncController()); // Initialize it only if not registered
  }
  // To use the controller:
  final surveyController = Get.find<SurveyTimeUnsyncController>();
  
  final port = IsolateNameServer.lookupPortByName('isolate_port1');

  await HiveService().init(); // Initialize Hive properly
  setup();

  // Open the Hive box
  var box = await Hive.openBox(HiveDirectoryUtil.submitSurveyBox);
  int count = 0;
  surveyController.setSurveyLastSync("66e4329edfe7e5246acd0dac", DateTime.now());
  while (box.values.isNotEmpty) {
    var key = box.keys.toList().length - 1;
    try {
      // SurveySubmitModel
      var surveyValue = await HiveService().getDataAt(HiveDirectoryUtil.submitSurveyBox, key);
      ApiResult<void> response = await getIt.get<SurveySubmitUc>().call(surveyValue);
      bool checkInternetConnection = true;
      response.when(
        success: (data) {
          HiveService().deleteDataAt(HiveDirectoryUtil.submitSurveyBox, key);
          HiveService().putData(HiveDirectoryUtil.surveyLastSyncDateTime,surveyValue.surveyId ?? "", DateTime.now());
           
        },
        failure: (error) async {
          surveyValue.failureReason = NetworkExceptions.getErrorMessage(error!);
          if (error == const NetworkExceptions.noInternetConnection()) {
            checkInternetConnection = false;
          }
          if (count == 3) {
            await HiveService().deleteDataAt(HiveDirectoryUtil.submitSurveyBox, key);
            await HiveService().addData(HiveDirectoryUtil.failedSurveyBox, surveyValue);
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

  port!.send(true);
}
