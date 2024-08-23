import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/customer_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_reponse_model.dart';

class SurveySubmitModel {
  final String? responseType;
  final String? uniqueRefCode;
  final String? trackRefCode;
  final String? companyId;
  final String? surveyId;
  final String? language;
  final DateTime? surveyStartDateTime;
  final DateTime? surveyFillStartDateTime;
  final DateTime? surveySubmitDateTime;
  final List<SurveyResponse>? surveyResponse;
  final Customer? customer;

  SurveySubmitModel({
    this.responseType,
    this.uniqueRefCode,
    this.trackRefCode,
    this.companyId,
    this.surveyId,
    this.language,
    this.surveyStartDateTime,
    this.surveyFillStartDateTime,
    this.surveySubmitDateTime,
    this.surveyResponse,
    this.customer,
  });

  Map<String, dynamic> toJsonSurveySubmit() {
    return {
      'responseType': responseType,
      'uniqueRefCode': uniqueRefCode,
      'trackRefCode': trackRefCode,
      'companyId': companyId,
      'surveyId': surveyId,
      'language': language,
      // 'surveyStartDateTime':surveyStartDateTime!=null? surveyStartDateTime!.toIso8601String():"",
      // 'surveyFillStartDateTime':surveyFillStartDateTime!=null ?  surveyFillStartDateTime!.toIso8601String():"",
      // 'surveySubmitDateTime':surveySubmitDateTime!=null? surveySubmitDateTime!.toIso8601String():"",
      "timeZone": -330,
      "surveyStartDateTime": "2024-05-23 13:10:52",
      "surveyFillStartDateTime": "2024-05-23 13:11:01",
      "surveySubmitDateTime": "2024-05-14 13:10:52",
      'surveyResponse': surveyResponse != null? surveyResponse!.map((response) => response.toJsonSurveyReponse())
              .toList()
          : "",
      'customer': customer == null ? {} : customer!.toJsonCustomer(),
   
    };
  }
}
