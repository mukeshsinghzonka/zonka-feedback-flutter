import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/basic_meta_deta_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/customer_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_reponse_model.dart';

class SurveySubmitModel{
    final String ? responseType;
    final String ?uniqueRefCode;
    final String ?trackRefCode;
    final String? companyId;
    final String ?surveyId;
    final String ?locationId;
    final String ? takenBy;
    final String ?language;
    final int? timeZone;
    final DateTime? surveyStartDateTime;
    final DateTime ?surveyFillStartDateTime;
    final DateTime? surveySubmitDateTime;
    final List<SurveyResponse> ?surveyResponse;
    final Customer ?customer;
    final List<dynamic>? queryParams;
    final String ?sourcePageTitle;
    final String ?sourcePageUrl;
    final String ?userAgent;
    final String ?ipAddress;
    final String? pageUrl;
    final String ?domain;
    final String ?pageName;
    final String ?resolution;
    final String ?browserResolution;
    final String? referralUrl;
    final String ?widgetType;
    final String ?referrerUrl;
    final String ?browserLanguage;
    final BasicMetaData ?basicMetaData;
    final dynamic browserFingerPrint;

    SurveySubmitModel({
         this.responseType,
         this.uniqueRefCode,
         this.trackRefCode,
         this.companyId,
         this.surveyId,
         this.locationId,
         this.takenBy,
         this.language,
         this.timeZone,
         this.surveyStartDateTime,
         this.surveyFillStartDateTime,
         this.surveySubmitDateTime,
         this.surveyResponse,
         this.customer,
         this.queryParams,
         this.sourcePageTitle,
         this.sourcePageUrl,
         this.userAgent,
         this.ipAddress,
         this.pageUrl,
         this.domain,
         this.pageName,
         this.resolution,
         this.browserResolution,
         this.referralUrl,
         this.widgetType,
         this.referrerUrl,
         this.browserLanguage,
         this.basicMetaData,
         this.browserFingerPrint,
    });


  Map<String, dynamic> toJsonSurveySubmit() {
    return {
      'responseType': responseType,
      'uniqueRefCode': uniqueRefCode,
      'trackRefCode': trackRefCode,
      'companyId': companyId,
      'surveyId': surveyId,
      'locationId': locationId,
      'takenBy': takenBy,
      'language': language,
      'timeZone': timeZone,
      'surveyStartDateTime': surveyStartDateTime!.toIso8601String(),
      'surveyFillStartDateTime': surveyFillStartDateTime!.toIso8601String(),
      'surveySubmitDateTime': surveySubmitDateTime!.toIso8601String(),
      'surveyResponse':surveyResponse!=null? surveyResponse!.map((response) => response.toJsonSurveyReponse()).toList():"",
      'customer':customer !=null? customer!.toJsonCustomer():"",
      'queryParams': queryParams,
      'sourcePageTitle': sourcePageTitle,
      'sourcePageUrl': sourcePageUrl,
      'userAgent': userAgent,
      'ipAddress': ipAddress,
      'pageUrl': pageUrl,
      'domain': domain,
      'pageName': pageName,
      'resolution': resolution,
      'browserResolution': browserResolution,
      'referralUrl': referralUrl,
      'widgetType': widgetType,
      'referrerUrl': referrerUrl,
      'browserLanguage': browserLanguage,
      'basicMetaData':basicMetaData!=null? basicMetaData!.toJsonBasicMeta():"",
      'browserFingerPrint': browserFingerPrint,
    };
  
  }


}
