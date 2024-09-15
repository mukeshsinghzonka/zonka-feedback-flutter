import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/customer_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/device_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_reponse_model.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'survey_submit_model.g.dart';

@HiveType(typeId: HiveTypeId.surveySubmitModel)
class SurveySubmitModel extends HiveObject  {
  @HiveField(0)
  final String? responseType;

  @HiveField(1)
  final int? timeZoneOffset;

  @HiveField(2)
  final String? companyId;

  @HiveField(3)
  final String? surveyId;

  @HiveField(4)
  final String? locationId;

  @HiveField(5)
  final String? language;

  @HiveField(6)
  final DateTime? surveyStartDateTime;

  @HiveField(7)
  final DateTime? surveyFillStartDateTime;

  @HiveField(8)
  final DateTime? surveySubmitDateTime;

  @HiveField(9)
  final List<SurveyResponse>? surveyResponse; // Ensure SurveyResponse is Hive compatible

  @HiveField(10)
  final Customer? customer; // Ensure Customer is Hive compatible

  @HiveField(11)
  final DeviceModel? deviceModel; // Ensure DeviceModel is Hive compatible

  @HiveField(12)
  final String? syncType;

  @HiveField(13)
  final String? deviceResponseRequestId;

  @HiveField(14)
  final String? ipAddress;
  
  @HiveField(15)
  String ? failureReason;

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
      this.failureReason,
      this.deviceResponseRequestId,
      this.deviceModel});

  Map<String, dynamic> toJsonSurveySubmit() {
    final Map<String, dynamic> data = {};
    DateFormat formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss');
    // Add non-null values to the map
    if (responseType != null) data['responseType'] = responseType;
    if (timeZoneOffset != null)
      data['timeZoneOffset'] = DateTime.now().timeZoneOffset.inMinutes;
    if (companyId != null) data['companyId'] = companyId;
    if (surveyId != null) data['surveyId'] = surveyId;
    if (language != null) data['language'] = language;
    if (locationId != null) data['locationId'] = locationId;
    if (deviceResponseRequestId != null)
      data['deviceResponseRequestId'] = deviceResponseRequestId;
    if (syncType != null) data['syncType'] = syncType;
    if (ipAddress != null) data['ipAddress'] = ipAddress;

    data['timeZone'] = DateTime.now().timeZoneName;
    if (surveyStartDateTime != null)
      data['surveyStartDateTime'] =
          formattedDate.format(surveyStartDateTime!).toString();
    if (surveyFillStartDateTime != null)
      data['surveyFillStartDateTime'] =
          formattedDate.format(surveyFillStartDateTime!).toString();
    if (surveySubmitDateTime != null)
      data['surveySubmitDateTime'] =
          formattedDate.format(surveySubmitDateTime!).toString();

    data['customer'] = customer != null ? customer!.toJsonCustomer() : {};
    data['device'] =
        deviceModel != null ? deviceModel!.toJsonDeviceModel() : {};

    if (surveyResponse != null) {
      data['surveyResponse'] = surveyResponse!
          .map((response) => response.toJsonSurveyReponse())
          .toList();
    }

    return data;
  }
}
