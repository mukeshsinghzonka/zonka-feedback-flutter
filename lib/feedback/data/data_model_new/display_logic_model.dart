

import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'display_logic_model.g.dart'; // This will be generated


@HiveType(typeId: HiveTypeId.displayLogicModelId) // Assign a unique typeId to the model
class DisplayLogicModel extends HiveObject {
  @HiveField(0)
  String? fieldId;

  @HiveField(1)
  String? actionTaken;

  @HiveField(2)
  String? choiceId;

  @HiveField(3)
  String? optionId;

  @HiveField(4)
  String? refValue;

  @HiveField(5)
  int? sequence;

  DisplayLogicModel({
    this.fieldId,
    this.actionTaken,
    this.choiceId,
    this.optionId,
    this.refValue,
    this.sequence,
  });

  factory DisplayLogicModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError("JSON data cannot be null");
    }
    return DisplayLogicModel(
      fieldId: json["fieldId"] ?? "",
      actionTaken: json["actionTaken"] ?? '',
      choiceId: json["choiceId"] ?? '',
      optionId: json["optionId"] ?? '',
      refValue: json["refValue"] ?? '',
      sequence: json["sequence"] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fieldId': fieldId,
      'actionTaken': actionTaken,
      'choiceId': choiceId,
      'optionId': optionId,
      'refValue': refValue,
      'sequence': sequence,
    };
  }
}
