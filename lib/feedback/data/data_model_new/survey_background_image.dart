import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'survey_background_image.g.dart'; // Required for Hive type adapter generation

@HiveType(typeId: HiveTypeId.surveyBackgroundImageId)// Unique ID for SurveyBgGalleryImageId adapter
class SurveyBgGalleryImageId extends HiveObject {
  @HiveField(0)
  final String path;

  @HiveField(1)
  final String id;

  @HiveField(2)
  final String companyId;

  SurveyBgGalleryImageId({
    required this.path,
    required this.id,
    required this.companyId,
  });

  factory SurveyBgGalleryImageId.fromJson(Map<String, dynamic>? json) {
    return SurveyBgGalleryImageId(
      path: json?["path"] ?? "",
      id: json?["_id"] ?? '',
      companyId: json?["companyId"] ?? "",
    );
  }
}
