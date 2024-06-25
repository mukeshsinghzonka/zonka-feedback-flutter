import 'package:zonka_feedback/surveys/data/data_model/survey_location_model.dart';

class SurveyResModel {
  final List<SurveyLocationModel> surveyLocationList;
  final String viewMode;
  final String mode;
  final bool iskioskmode;
  final String defaultLanguageCode;
  final bool  isActive;
  final String workSpaceId;
  final String surveyId;
  final String surveyName;
  final int surveyMongifiedId;

  SurveyResModel({
    required this.surveyLocationList,
    required this.viewMode,
    required this.mode,
    required this.defaultLanguageCode,
    required this.isActive,
    required this.workSpaceId,
    required this.surveyId,
    required this.surveyName,
    required this.surveyMongifiedId,
    this.iskioskmode = false,
  });


  factory SurveyResModel.fromJson(Map<String, dynamic> json) {
    return SurveyResModel(
      surveyLocationList:(json['locations'] as List).map((e) => SurveyLocationModel.fromJson(e)).toList(),
      viewMode: json['viewMode']??"",
      mode: json['mode'],
      defaultLanguageCode: json['defaultLanguageCode']??"",
      isActive: json['isActive']??false,
      workSpaceId: json['workSpace']??"",
      surveyId: json['_id']??"",
      surveyName: json['name']??"",
      surveyMongifiedId: json['pre_mongified_id']??"",
      iskioskmode:json['mode'] == 'kiosk'?true:false,
    );
  }
}

