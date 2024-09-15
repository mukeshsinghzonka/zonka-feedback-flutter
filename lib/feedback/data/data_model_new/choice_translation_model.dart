// ChoiceTranslation Model
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';


part 'choice_translation_model.g.dart';

@HiveType(typeId: HiveTypeId.choiceTranlationModelId)
class ChoiceTranslation extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? helpText;

  ChoiceTranslation({
    required this.name,
    required this.helpText,
  });

  factory ChoiceTranslation.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError("JSON data cannot be null");
    }
    return ChoiceTranslation(
      name: json["name"],
      helpText: json["helpText"],
    );
  }

  @override
  List<Object?> get props => [name, helpText];
}
