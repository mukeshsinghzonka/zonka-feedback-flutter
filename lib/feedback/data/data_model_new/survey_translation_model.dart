
import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'survey_translation_model.g.dart'; // Required for Hive type adapter generation

@HiveType(typeId: HiveTypeId.surveyTranslationModelId)// Unique ID for SurveyTranslation adapter
class SurveyTranslation extends HiveObject {
  @HiveField(0)
  final String? clearButText;

  @HiveField(1)
  final String? getStartedButText;

  @HiveField(2)
  final String? nextArrowText;

  @HiveField(3)
  final String? previousArrowText;

  @HiveField(4)
  final String? skipNavText;

  @HiveField(5)
  final String? submitButtonText;

  SurveyTranslation({
    required this.clearButText,
    required this.getStartedButText,
    required this.nextArrowText,
    required this.previousArrowText,
    required this.skipNavText,
    required this.submitButtonText,
  });

  factory SurveyTranslation.fromJson(Map<String, dynamic>? json) {
    return SurveyTranslation(
      clearButText: json?["clearButText"],
      getStartedButText: json?["getStartedButText"],
      nextArrowText: json?["nextArrowText"],
      previousArrowText: json?["previousArrowText"],
      skipNavText: json?["skipNavText"],
      submitButtonText: json?["submitButtonText"],
    );
  }
}
