import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'option_translation.g.dart'; // Required for Hive type adapter generation


@HiveType(typeId: HiveTypeId.optionTranslationId)// Unique type ID for OptionTranslation adapter
class OptionTranslation extends HiveObject {
  @HiveField(0)
  final String? name;

  OptionTranslation({
    required this.name,
  });

  factory OptionTranslation.fromJson(Map<String, dynamic> json) {
    return OptionTranslation(
      name: json["name"],
    );
  }
}
