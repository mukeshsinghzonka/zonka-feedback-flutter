import 'package:zonka_feedback/dashboard/data/data_model/workspace_model.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_feedback_uc.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_res_model.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

Future<void> downloadAllSurvey() async {
  await HiveService().init();
  setup();
  try {
    var surveyList = await HiveService().getData(HiveDirectoryUtil.surveyResModelBox, HiveKey.surveyResKey);
    var workSpaceList = await HiveService().getData(HiveDirectoryUtil.workSpaceModelBox, HiveKey.workSpaceKey);

    // Map to store workspaceId and corresponding surveyIds
    Map<String, List<String>> workspaceMapSurveyId = {};

    // Log the fetched data for debugging
    print("Fetched workspace data: $workSpaceList");
    print("Fetched survey data: $surveyList");

    // Cast workspace data to List<WorkspaceModel>
    List<WorkspaceModel> workspaceListNew = List<WorkspaceModel>.from(workSpaceList);

    // Initialize the map with workspace IDs
    for (var workspace in workspaceListNew) {
      workspaceMapSurveyId[workspace.workSpaceId] = [];
    }

    // Cast survey data to List<SurveyResModel>
    List<SurveyResModel> surveyResModelList = List<SurveyResModel>.from(surveyList);

    // Populate the map with survey IDs corresponding to workspace IDs
    for (var survey in surveyResModelList) {
      if (workspaceMapSurveyId.containsKey(survey.workSpaceId)) {
        workspaceMapSurveyId[survey.workSpaceId]!.add(survey.surveyId);
      } else {
        print("workspaceMapSurveyId ${survey.surveyId}");
      }
    }

    // Log the final mapping
    print("Workspace and Survey ID Map: $workspaceMapSurveyId");

    print("worspancekidkeymapping ${workspaceMapSurveyId} ${workspaceMapSurveyId.keys.length} ");
 for (var key in workspaceMapSurveyId.keys) {
  List<String>? surveyIdList = workspaceMapSurveyId[key];

  // Proceed only if surveyIdList is not null or empty
  if (surveyIdList != null && surveyIdList.isNotEmpty) {
    for (String surveyId in surveyIdList) {
      // Fetch data for each survey from Hive
      dynamic valueSurvey = await HiveService().getData(HiveDirectoryUtil.surveyDownloadResponseBox, surveyId);

      if (valueSurvey != null) {
        // Survey is already downloaded
        print("Survey already downloaded: $surveyId");
      } else {
        // Survey not found locally, trigger download
        print("Survey not found locally. Fetching from network: $surveyId");

        // Handle survey download
        await getIt.get<SurveyFeedbackUc>().call(surveyId);

        // Optionally, after fetching, you might want to store it back into Hive
        // await HiveService().putData(HiveDirectoryUtil.surveyDownloadResponseBox, surveyId, fetchedSurveyData);
      }
    }
  }
}


  } catch (e) {
    print("Error processing survey");
  }
}
