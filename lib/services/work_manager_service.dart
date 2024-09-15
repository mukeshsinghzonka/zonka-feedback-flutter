import 'package:hive/hive.dart';
import 'package:workmanager/workmanager.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_submit_model.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_submit_uc.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';

Future<void> syncAllSurveyReponse() async {
  try {
    await HiveService().init();
    setup();

    // Open the Hive box
    var box = await Hive.openBox(HiveDirectoryUtil.submitSurveyBox);
    // List<dynamic> boxKeyList = box.keys.toList();
    // Loop from last key to the first
    while (box.keys.isNotEmpty) {
      var key =  box.keys.toList().length - 1;
      try {
        print("Processing survey with key: $key");

        // Fetch the survey data for the given key
        SurveySubmitModel surveyValue = await HiveService().getDataAt(HiveDirectoryUtil.submitSurveyBox, key);
        
        print("Survey data for key $key: $surveyValue");

        // Ensure the surveyValue is not null before proceeding
      
        // Perform the survey submission
        ApiResult<void> response = await getIt.get<SurveySubmitUc>().call(surveyValue);
        bool checkInternetConnection = true;
        response.when(
          success: (data) {
            // Delete the survey data after successful submission
            HiveService().deleteDataAt(HiveDirectoryUtil.submitSurveyBox, key);
            print("Survey with key $key successfully synced and deleted.");
          },
          failure: (error) async {
            
             surveyValue.failureReason = NetworkExceptions.getErrorMessage(error!);
             if(error == const NetworkExceptions.noInternetConnection()){
                checkInternetConnection = false;
             }
             await HiveService().deleteDataAt(HiveDirectoryUtil.submitSurveyBox, key);
             await HiveService().addData(HiveDirectoryUtil.failedSurveyBox, surveyValue);
            print("Failed to sync survey with key $key. Error: $error");
          },
        );

        if(checkInternetConnection == false){
           break;
        }
         var allSurveyKeys = box.keys.toList();
        print("allsurveykeys ${allSurveyKeys}");
      } catch (e) {
        print("Error processing survey with key $key: $e");
      }
    }
  } catch (e) {
    print("Error during syncAllSurveyReponse: $e");
  }
}


@pragma('vm:entry-point')
void callBackWorkManager() {
  Workmanager().executeTask((taskName, inputData) async {
    switch (taskName) {
      case 'updateSurveyTask':
        await syncAllSurveyReponse();
        break;
    }
    return Future.value(true);
  });
}

class WorkManagerService {
  static final WorkManagerService _instance = WorkManagerService.internal();
  WorkManagerService.internal();
  factory WorkManagerService() => _instance;

  String taskName = 'updateSurveyTask';

  void initWorkManager() async {
    await Workmanager().initialize(
      callBackWorkManager,
      isInDebugMode: true,
    );
  }

  void startWorkManager() {
    var uniqueId = DateTime.now().second.toString();
    Workmanager().registerOneOffTask(uniqueId, taskName,
        initialDelay: const Duration(seconds: 10),
        constraints: Constraints(networkType: NetworkType.connected));
  }
}
