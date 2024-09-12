import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_reponse_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_submit_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/submit_survey_manager.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/network_connectivity.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';

class SurveySyncController extends GetxController {
  
  final SurveyDesignFieldController surveyFieldController =
      Get.find<SurveyDesignFieldController>();
  final SurveyScreenManager surveyScreenManager =
      Get.find<SurveyScreenManager>();
  final SubmitSurveyManagerController submitsurvey =
      Get.put(SubmitSurveyManagerController());
  final SurveryApiFeedbackController surveyApicontroller =
      Get.find<SurveryApiFeedbackController>();
  final SurveyCollectDataController surveyCollectDataController =
      Get.find<SurveyCollectDataController>();

  List<SurveyResponse>? createSurveyResponseData() {
    List<SurveyResponse> listSurveyResponse = [];
    surveyCollectDataController.surveyIndexData.forEach((key, value) {
      dynamic surveyDetail = surveyCollectDataController.createDataForApiHit(
          key, surveyScreenManager.mapSurveyIdAndFieldName[key] ?? "");
      if (surveyDetail is List<SurveyResponse>) {
        listSurveyResponse.addAll(surveyDetail);
      } else if (surveyDetail is SurveyResponse) {
        listSurveyResponse.add(surveyDetail);
      }
    });
    return listSurveyResponse.isNotEmpty ? listSurveyResponse : null;
  }

Future<void> addDataToHiveLocal(SurveySubmitModel submitSurveyModel)async {
    dynamic value = await HiveService().getData(HiveDirectoryUtil.submitSurveyBox,surveyApicontroller.surveyModel.value.id ?? "");
      List<SurveySubmitModel> surveyModelList = [];
      if (value != null && value is List) {
        // Try casting each item in the list to SurveySubmitModel
        surveyModelList.addAll(value.map((e) => e as SurveySubmitModel).toList());
      }
      surveyModelList.add(submitSurveyModel);
      await HiveService().putData(HiveDirectoryUtil.submitSurveyBox, surveyApicontroller.surveyModel.value.id ?? "", surveyModelList);
}

  Future<void> asyncDurationValue() async {
    bool checkInternetConnection = await NetworkConnectivity().isConnected();

    SurveySubmitModel submitSurveyModel = SurveySubmitModel(
        responseType: 'Device',
        language: surveyFieldController.defaultTranslation.value,
        syncType: "Auto", //Manual
        // deviceModel: DeviceModel(appVersion: , appVersionCode: appVersionCode, deviceBatteryLevel: deviceBatteryLevel, deviceOsVersion: deviceOsVersion, networkType: networkType, syncType: syncType),
        surveyId: surveyApicontroller.surveyModel.value.id,
        surveyStartDateTime: surveyFieldController.surveyStartDateTime.value,
        surveySubmitDateTime: DateTime.now(),
        surveyFillStartDateTime: surveyFieldController.surveyFillDateTime.value,
        surveyResponse: createSurveyResponseData());

    if (checkInternetConnection) {
      await submitsurvey.call(submitSurveyModel);
      if(submitsurvey.apiStatus.value == ApiCallStatus.Error){
          await addDataToHiveLocal(submitSurveyModel);
      }
    } else {
       await addDataToHiveLocal(submitSurveyModel);
    }

    surveyCollectDataController.surveyIndexData.clear();
    // if (!_isDelayCalled) {
    //   _isDelayCalled = true;
    //    await Future.delayed(Duration(seconds: surveyFieldController.thankyouScreenTimeout.value)).then((value){
    //   print("surveyfieldcontroller");
    // });
    // }

    // surveyScreenManager.updateScreenTypeUtilFunction();
  }
}
