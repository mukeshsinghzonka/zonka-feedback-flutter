import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';

import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';
part 'survey_screen_model.g.dart'; // Required for Hive type adapter generation

@HiveType(typeId: HiveTypeId.surveyScreenModelId)// Unique ID for SurveyScreenModel adapter
class SurveyScreenModel extends HiveObject {
  @HiveField(0)
  final int? screenSequenceOrder;

  @HiveField(1)
  final String? columnLayout;

  @HiveField(2)
  final List<Field> fields;

  SurveyScreenModel({
    required this.screenSequenceOrder,
    required this.columnLayout,
    required this.fields,
  });

  factory SurveyScreenModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError("JSON data cannot be null");
    }

    return SurveyScreenModel(
      screenSequenceOrder: json["screenSequenceOrder"],
      columnLayout: json["columnLayout"],
      fields: json["fields"] == null
          ? []
          : List<Field>.from(json["fields"]!.map((x) => Field.fromJson(x))),
    );
  }
}
