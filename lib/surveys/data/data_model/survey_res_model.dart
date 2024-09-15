import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_location_model.dart';

part 'survey_res_model.g.dart';

@HiveType(typeId: HiveTypeId.surveyResModelId)
class SurveyResModel extends HiveObject{

  @HiveField(10)
  final List<SurveyLocationModel> surveyLocationList;

  @HiveField(1)
  final String viewMode;

  @HiveField(2)
  final String mode;

  @HiveField(3)
  final bool iskioskmode;

  @HiveField(4)
  final String defaultLanguageCode;

  @HiveField(5)
  final bool isActive;

  @HiveField(6)
  final String workSpaceId;

  @HiveField(7)
  final String surveyId;

  @HiveField(8)
  final String surveyName;

  @HiveField(9)
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

  Map<String, dynamic> toJson() {
    return {
      'locations': surveyLocationList.map((e) => e.toJson()).toList(),
      'viewMode': viewMode,
      'mode': mode,
      'defaultLanguageCode': defaultLanguageCode,
      'isActive': isActive,
      'workSpace': workSpaceId,
      '_id': surveyId,
      'name': surveyName,
      'pre_mongified_id': surveyMongifiedId,
    };
  }
}

