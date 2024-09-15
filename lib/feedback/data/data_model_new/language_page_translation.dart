import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'language_page_translation.g.dart'; // Required for Hive type adapter generation


@HiveType(typeId: HiveTypeId.languagePageTranslationId)// Unique type ID for LanguagePageTranslation adapter
class LanguagePageTranslation extends HiveObject {
  @HiveField(0)
  final String? upperText;

  @HiveField(1)
  final String? bottomText;

  LanguagePageTranslation({
    required this.upperText,
    required this.bottomText,
  });

  factory LanguagePageTranslation.fromJson(Map<String, dynamic> json) {
    return LanguagePageTranslation(
      upperText: json["upperText"],
      bottomText: json["bottomText"],
    );
  }
}
