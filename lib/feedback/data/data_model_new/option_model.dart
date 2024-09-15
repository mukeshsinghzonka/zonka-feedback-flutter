

import 'package:zonka_feedback/feedback/data/data_model_new/option_translation.dart';

import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'option_model.g.dart'; // Required for Hive type adapter generation


@HiveType(typeId: HiveTypeId.optionModelId)// Unique type ID for Option adapter
class Option extends HiveObject {
  @HiveField(0)
  final String? optionNodeId;

  @HiveField(1)
  final String? id;

  @HiveField(2)
  final Map<String, OptionTranslation>? translations;

  @HiveField(3)
  final int? preMongifiedId;

  Option({
    required this.optionNodeId,
    required this.id,
    required this.translations,
    required this.preMongifiedId,
  });

  factory Option.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError("JSON data cannot be null");
    }

    return Option(
      optionNodeId: json["optionNodeId"],
      id: json["_id"],
      translations: json["translations"] == null
          ? null
          : Map.from(json["translations"]).map((k, v) =>
              MapEntry<String, OptionTranslation>(k, OptionTranslation.fromJson(v))),
      preMongifiedId: json["pre_mongified_id"],
    );
  }
}
