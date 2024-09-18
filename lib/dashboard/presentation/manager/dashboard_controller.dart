import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/workspace_controller.dart';
import 'package:zonka_feedback/location/presentation/manager/location_controller.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/workmanager_functions/work_manager_service.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_controller.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_manage_controller.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

class DashboardController extends BaseControllerWithOutParams<void> {
  final locationController = Get.put(LocationController());
  final workSpaceController = Get.put(WorkspaceController());
  final surveyController = Get.put(SurveyController());
  final _surveyManagerController = Get.put(SurveyManagerController());
  final overlayController = OverlayPortalController();


 Future<void> downloadSurveyManager() async {
    // var value = await HiveService().getData(HiveDirectoryUtil.surveyDownloadResponseBox,HiveKey.surveyDownloadedBool);
    // if (value == false) {
      WorkManagerService().downloadAllSurveyTask();
      // await HiveService().putData(HiveDirectoryUtil.surveyDownloadResponseBox,HiveKey.surveyDownloadedBool, true);
    // }
  }

  @override
  Future<void> call() async {
    setStatus(ApiCallStatus.Loading);
    await workSpaceController.call();
    await surveyController.call();
    await _surveyManagerController.getSurveyListWorkspace();
    downloadSurveyManager();
    setStatus(ApiCallStatus.Success);
  }
}
