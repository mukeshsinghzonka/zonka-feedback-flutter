

import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'update_survey_model.g.dart'; // This will be generated after running build_runner

@HiveType(typeId: HiveTypeId.updateSurveyId) // Assign a unique typeId
class UpdateSurveyModel extends HiveObject {
  @HiveField(0)
  final String surveyId;

  @HiveField(1)
  final DateTime? modifiedDate;

  UpdateSurveyModel({required this.surveyId, required this.modifiedDate});

  factory UpdateSurveyModel.fromJson(Map<String, dynamic> json) {
    print("updatedatetimevalue ${DateTime.parse(json['modifiedDate']).toUtc()} ${json['surveyId']}");
    return UpdateSurveyModel(
        surveyId: json['surveyId'],
        modifiedDate: json['modifiedDate'] != null
            ?  DateTime.parse(json['modifiedDate']).toUtc()
            : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'surveyId': surveyId,
      'modifiedDate': modifiedDate?.toIso8601String(),
    };
  }
}
