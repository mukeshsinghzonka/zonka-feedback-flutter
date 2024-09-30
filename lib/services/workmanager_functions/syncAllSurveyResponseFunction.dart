import 'dart:convert';
import 'dart:ui';
import 'package:hive/hive.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_submit_uc.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/services/workmanager_functions/sync_survey_send_port_model.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';

Future<void> syncAllSurveyReponse() async {

  final port = IsolateNameServer.lookupPortByName('isolate_port1');

  await HiveService().init(); // Initialize Hive properly
  setup();

  // Open the Hive boxNm
  var box = await Hive.openBox(HiveDirectoryUtil.submitSurveyBox);


  int count = 0;
  while (box.values.isNotEmpty) {
    var key = box.keys.toList().length - 1;
    try {
      // SurveySubmitModel
      var surveyValue = await HiveService().getDataAt(HiveDirectoryUtil.submitSurveyBox, key);
      ApiResult<void> response = await getIt.get<SurveySubmitUc>().call(surveyValue);
      bool checkInternetConnection = true;
      response.when(
        success: (data) async {
          HiveService().deleteDataAt(HiveDirectoryUtil.submitSurveyBox, key);
          HiveService().putData(HiveDirectoryUtil.surveyLastSyncDateTime,surveyValue.surveyId ?? "", DateTime.now());
          dynamic count = await HiveService().getData(HiveDirectoryUtil.surveyUnsyncResponseCount, surveyValue.surveyId??"");
          await HiveService().putData(HiveDirectoryUtil.surveyUnsyncResponseCount, surveyValue.surveyId??"",count == null? 0:count <= 0 ? 0 : count - 1);
          port!.send(jsonEncode(SyncSurveyPortModel(dateTime:DateTime.now(),surveyId:surveyValue.surveyId??"").toJson()));
        },
        failure: (error) async {
          surveyValue.failureReason = NetworkExceptions.getErrorMessage(error!);
          if (error == const NetworkExceptions.noInternetConnection()) {
            checkInternetConnection = false;
          }
          if (count == 3) {
            await HiveService().deleteDataAt(HiveDirectoryUtil.submitSurveyBox, key);
            dynamic countvalue = await HiveService().getData(HiveDirectoryUtil.surveyUnsyncResponseCount, surveyValue.surveyId??"");
            await HiveService().putData(HiveDirectoryUtil.surveyUnsyncResponseCount, surveyValue.surveyId??"",countvalue == null? 0:countvalue <= 0 ? 0 : countvalue - 1);
            port!.send(jsonEncode(SyncSurveyPortModel(dateTime:DateTime.now(),surveyId:surveyValue.surveyId??"").toJson()));
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

}
