import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/workspace_controller.dart';
import 'package:zonka_feedback/location/presentation/manager/location_controller.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_controller.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_manage_controller.dart';

class DashboardController extends GetxController {
  final locationController = Get.put(LocationController());
  final workSpaceController = Get.put(WorkspaceController());
  final surveyController = Get.put(SurveyController());
  final _surveyManagerController = Get.put(SurveyManagerController());
  final overlayController = OverlayPortalController();

  void initDashBoardApi() async {
    //Always call locationController first.
    // await locationController.call();
    await workSpaceController.call();
    await surveyController.call();
    _surveyManagerController.getSurveyListWorkspace();
  }

}
