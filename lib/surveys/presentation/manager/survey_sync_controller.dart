import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/device_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_reponse_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_submit_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/submit_survey_manager.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/services/device_info/battery_info.dart';
import 'package:zonka_feedback/services/device_info/device_info.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/network_connectivity.dart';
import 'package:zonka_feedback/surveys/domain/entity/survey_count_response.dart';
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
  AndroidDeviceInfo androidDeviceInfo = DeviceInfoService().androidInfo;
  final BatteryInfoService _batteryInfoService = BatteryInfoService();

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

  Future<void> addDataToHiveLocal(SurveySubmitModel submitSurveyModel) async {
    await HiveService()
        .addData(HiveDirectoryUtil.submitSurveyBox, submitSurveyModel);
  }

  Future<void> updateTotalSurveyAdded(SurveySubmitModel submitSurveyModel) async {
    var responseData = await HiveService().getData(HiveDirectoryUtil.totalSurveySubmitResponse,submitSurveyModel.surveyId ?? "");
    var valueFinal = SurveyCountResponseData(count: 1, dateTime: DateTime.now());
    if (responseData != null) {
      var tempVal = responseData;
      Duration value = DateTime.now().difference(tempVal.dateTime);
       if(value.inHours > 24 ){
          valueFinal =  SurveyCountResponseData(count: 1, dateTime: DateTime.now());
       }
       else{
         valueFinal =  tempVal;
         int finalCount =  valueFinal.count;
         valueFinal.count = finalCount + 1;
       }
    }
    await HiveService().putData(HiveDirectoryUtil.totalSurveySubmitResponse,submitSurveyModel.surveyId ?? "", valueFinal);
  }

  Future<void> asyncDurationValue({required String syncType}) async {
    List<SurveyResponse>? surveyResponse = createSurveyResponseData();
    SurveySubmitModel submitSurveyModel = SurveySubmitModel(
        responseType: 'Device',
        language: surveyFieldController.defaultTranslation.value,
        syncType: "Auto", //Manual
        deviceModel: DeviceModel(
            appVersion: '4.12',
            appVersionCode: androidDeviceInfo.version.codename,
            deviceBatteryLevel: _batteryInfoService.batteryLevel.toString(),
            deviceOsVersion: androidDeviceInfo.version.baseOS,
            networkType: '',
            syncType: syncType),
        surveyId: surveyApicontroller.surveyModel.value.id,
        surveyStartDateTime: surveyFieldController.surveyStartDateTime.value,
        surveySubmitDateTime: DateTime.now(),
        surveyFillStartDateTime: surveyFieldController.surveyFillDateTime.value,
        surveyResponse: surveyResponse);

    bool checkInternetConnection = await NetworkConnectivity().isConnected();

    if (checkInternetConnection) {
      await submitsurvey.call(submitSurveyModel);
      if (submitsurvey.apiStatus.value == ApiCallStatus.Error) {
        await addDataToHiveLocal(submitSurveyModel);
      }
    } else {
      await addDataToHiveLocal(submitSurveyModel);
    }

    try {
      await updateTotalSurveyAdded(submitSurveyModel);
    } catch (e) {
      print("updatedsurvey $e");
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
