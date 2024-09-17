import 'package:workmanager/workmanager.dart';
import 'package:zonka_feedback/services/workmanager_functions/downloadAllSurvey.dart';
import 'package:zonka_feedback/services/workmanager_functions/syncAllFailedSurveyReponseFunction.dart';
import 'package:zonka_feedback/services/workmanager_functions/syncAllSurveyResponseFunction.dart';


@pragma('vm:entry-point')
void callBackWorkManager() {
  Workmanager().executeTask((taskName, inputData) async {
    switch (taskName) {
      case 'updateSurveyTask':
        await syncAllSurveyReponse();
        break;
      case 'updateFailedSurveyTask':
        await syncAllFailedSurveyReponse();
        break;
      case 'downloadAllSurvey':
        await downloadAllSurvey(inputData);
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
  String taskNameUpdate = 'updateFailedSurveyTask';
  String downloadAllSurvey = "downloadAllSurvey";
  void initWorkManager() async {
    await Workmanager().initialize(
      callBackWorkManager,
      isInDebugMode: true,
    );
  }

  void startWorkManager() {
    var uniqueId = DateTime.now().second.toString();
    Workmanager().registerOneOffTask(uniqueId, taskName,
        initialDelay: const Duration(seconds: 1),
        constraints: Constraints(networkType: NetworkType.connected));
  }

  void updateFailedSurveyTask() {
    var uniqueId = DateTime.now().second.toString();
    Workmanager().registerPeriodicTask(uniqueId, taskNameUpdate,
        initialDelay: const Duration(seconds: 2),
        frequency: const Duration(hours: 24),
        constraints: Constraints(networkType: NetworkType.connected));
  }

  void downloadAllSurveyTask(Map<String, dynamic>? value) {
    var uniqueId = DateTime.now().second.toString();
    Workmanager().registerOneOffTask(uniqueId, downloadAllSurvey,
        initialDelay: const Duration(seconds: 1),
        inputData: value,
        constraints: Constraints(networkType: NetworkType.connected));
  }
}
