

class DisplayLogicModel {
  String? fieldId;
  String? actionTaken;
  String? choiceId;
  String? optionId;
  String? refValue;
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
}
