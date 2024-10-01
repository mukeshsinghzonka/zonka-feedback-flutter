import 'dart:convert';
import 'dart:ui';

import 'package:zonka_feedback/feedback/domain/usecase/survey_feedback_uc.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/workmanager_functions/workmanager_model/update_survey_model.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

Future<void> downloadUpdatedAllSurvey() async {
  try {
    final port = IsolateNameServer.lookupPortByName('isolate_port2');

    // Initialize Hive service if not already done
    await HiveService().init();

    // Perform necessary setup
    setup();

    // Fetch updated survey models from Hive
    dynamic updateResSurveyModel = await HiveService().getData(HiveDirectoryUtil.updateHiveSurveyId, HiveKey.updateSurveyKey,);
    int countSurveyUdpateAvailable = 0;
    List<String> surveyId= [];
    // Loop through the survey models to update or delete as needed
    for (var surveyModel in updateResSurveyModel) {
      try {
        if (surveyModel.updatesAvailable) {
          // Perform update operation

          await getIt.get<SurveyFeedbackUc>().call(surveyModel.surveyId);
          surveyId.add(surveyModel.surveyId);
          countSurveyUdpateAvailable += 1;
        } else if (surveyModel.isDeleted) {
          // Perform delete operation
          await HiveService().deleteData(
            HiveDirectoryUtil.surveyDownloadResponseBox,
            surveyModel.surveyId,
          );
        }
      } catch (innerError) {
        // Handle errors related to a specific survey
        print("Error processing surveyId: ${surveyModel.surveyId}, Error: $innerError");
      }
    }
    UpdateSurveyModelValue updateSurveyModelValue = UpdateSurveyModelValue(
      surveyUpdateDateTime: DateTime.now(),
      countSurveyUpdated: countSurveyUdpateAvailable,
      surveyId: surveyId
    );
    String jsonData = jsonEncode(updateSurveyModelValue.toJson());

    port!.send(jsonData);
  } catch (e) {
    // General error handling
    print("Error processing surveys: $e");
  }
}
