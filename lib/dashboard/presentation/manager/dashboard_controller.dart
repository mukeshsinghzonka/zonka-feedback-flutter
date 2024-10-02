import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/workspace_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/auto_suggest_api_manager.dart';
import 'package:zonka_feedback/location/presentation/manager/location_controller.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/setting/manager/country_code_controller.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_controller.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_manage_controller.dart';
import 'package:zonka_feedback/template/presentation/manager/get_template_manager.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import '../../../feedback/presentation/manager/language_api_manager.dart';

class DashboardController extends BaseControllerWithOutParams<void> {
  final locationController = Get.put(LocationController());
  final workSpaceController = Get.put(WorkspaceController());
  final surveyController = Get.put(SurveyController());
  final _surveyManagerController = Get.put(SurveyManagerController());
  final _languageManagerController = Get.put(LanguageManagerController());
  final overlayController = OverlayPortalController();
  final countryCodeController = Get.put(CountryCodeController());
  final autoSuggestController = Get.put(AutoSuggestApiManager());
  final getTemplateManager = Get.put(GetTemplateManager());




  @override
  Future<void> call() async {
    setStatus(ApiCallStatus.Loading);
    await workSpaceController.call();
    await surveyController.call();
    await _surveyManagerController.getSurveyListWorkspace();
    countryCodeController.call();
    _languageManagerController.call('Remote');
    autoSuggestController.call();
    getTemplateManager.call();

    setStatus(ApiCallStatus.Success);
  }
}
