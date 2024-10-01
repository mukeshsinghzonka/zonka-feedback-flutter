
import 'package:hive/hive.dart';

import '../../hive/hive_type_id.dart';

part 'update_survey_model.g.dart';
// Annotate the class to be a Hive type
@HiveType(typeId: HiveTypeId.updateSurveyModelValue) // Ensure typeId is unique
class UpdateSurveyModelValue extends HiveObject {
  // Annotate fields to store them in Hive
  @HiveField(0)
  final DateTime surveyUpdateDateTime;

  @HiveField(1)
  final int countSurveyUpdated;

  @HiveField(2)
  final List<String>? surveyId;

  UpdateSurveyModelValue({
    required this.countSurveyUpdated,
    required this.surveyUpdateDateTime,
    required this.surveyId
  });

  // Factory constructor to create an instance from JSON
  factory UpdateSurveyModelValue.fromJson(Map<String, dynamic> json) {
    return UpdateSurveyModelValue(
      countSurveyUpdated: json['countSurveyUpdated'],
      surveyUpdateDateTime: DateTime.parse(json['surveyUpdateDateTime']),
      surveyId: json['surveyId'] != null
          ? List<String>.from(json['surveyId'] as List<dynamic>)
          : <String>[], // Parse List<String> from JSON array
    );
  }
  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'countSurveyUpdated': countSurveyUpdated,
      'surveyUpdateDateTime': surveyUpdateDateTime.toIso8601String(), // Convert DateTime to ISO 8601 string
      'surveyId': surveyId, // Convert List<String> to JSON array
    };
  }
}

