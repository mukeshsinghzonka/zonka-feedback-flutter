import 'package:intl/intl.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/customer_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/device_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_reponse_model.dart';

class SurveySubmitModel {
  final String? responseType;
  final int? timeZoneOffset;
  final String? companyId;
  final String? surveyId;
  final String? locationId;
  final String? language;
  final DateTime? surveyStartDateTime;
  final DateTime? surveyFillStartDateTime;
  final DateTime? surveySubmitDateTime;
  final List<SurveyResponse>? surveyResponse;
  final Customer? customer;
  final DeviceModel? deviceModel;
  final String ?syncType;
  final String ? deviceResponseRequestId;
  final String ? ipAddress;

  SurveySubmitModel(
      {this.responseType,
      this.timeZoneOffset,
      this.companyId,
      this.surveyId,
      this.language,
      this.ipAddress,
      this.surveyStartDateTime,
      this.surveyFillStartDateTime,
      this.surveySubmitDateTime,
      this.surveyResponse,
      this.syncType,
      this.customer,
      this.locationId,
      this.deviceResponseRequestId,
      this.deviceModel});

 Map<String, dynamic> toJsonSurveySubmit() {
    final Map<String, dynamic> data = {};
     DateFormat formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss');
    // Add non-null values to the map
    if (responseType != null) data['responseType'] = responseType;
    if (timeZoneOffset != null) data['timeZoneOffset'] = DateTime.now().timeZoneOffset.inMinutes;
    if (companyId != null) data['companyId'] = companyId;
    if (surveyId != null) data['surveyId'] = surveyId;
    if (language != null) data['language'] = language;
    if (locationId != null) data['locationId'] = locationId;
    if (deviceResponseRequestId != null) data['deviceResponseRequestId'] = deviceResponseRequestId;
    if (syncType != null) data['syncType'] = syncType;
    if (ipAddress != null) data['ipAddress'] = ipAddress;

    data['timeZone'] = DateTime.now().timeZoneName;
    if (surveyStartDateTime != null) data['surveyStartDateTime'] = formattedDate.format(surveyStartDateTime!).toString();
    if (surveyFillStartDateTime != null) data['surveyFillStartDateTime'] = formattedDate.format(surveyFillStartDateTime!).toString();
    if (surveySubmitDateTime != null) data['surveySubmitDateTime'] =formattedDate.format(surveySubmitDateTime!).toString();

    data['customer'] = customer != null ? customer!.toJsonCustomer() : {};
    data['device'] = deviceModel != null ? deviceModel!.toJsonDeviceModel() : {};

    if (surveyResponse != null) {
      data['surveyResponse'] = surveyResponse!.map((response) => response.toJsonSurveyReponse()).toList();
    }

    return data;
  }
  // Map<String, dynamic> toJsonSurveySubmit() {
  //   return {
  //     'responseType': responseType,
  //     'timeZoneOffset': DateTime.now().timeZoneOffset,
  //     'companyId': companyId,
  //     'surveyId': surveyId,
  //     'language': language,
  //     "locationId": locationId,
  //     "deviceResponseRequestId":deviceResponseRequestId,
  //     "syncType":syncType,
  //     "ipAddress":ipAddress,
  //     "timeZone": DateTime.now().timeZoneName,
  //     "surveyStartDateTime": surveyStartDateTime == null ? "" : surveyStartDateTime.toString(),
  //     "surveyFillStartDateTime": surveyFillStartDateTime==null?"":surveyFillStartDateTime.toString(),
  //     "surveySubmitDateTime":  surveySubmitDateTime == null ? "" : surveySubmitDateTime.toString(),
  //     'customer': customer == null ? {} : customer!.toJsonCustomer(),
  //     'device': deviceModel == null ? {} : deviceModel!.toJsonDeviceModel(),
  //     'surveyResponse': surveyResponse != null ? 
  //      surveyResponse!.map((response) => response.toJsonSurveyReponse()).toList()
  //         : "",
  //   };
  // }
}
