class DisplayLogicModel {

  final String fieldId;
  final String actionTaken;
  final String choiceId;
  final String optionId;
  final String refValue;
  final int  sequence;

  DisplayLogicModel({
    required this.fieldId,
    required this.actionTaken,
    required this.choiceId,
    required this.optionId,
    required this.refValue,
    required this.sequence,
  });

  factory DisplayLogicModel.fromJson(Map<String, dynamic> ? json) {
    if (json == null) {
      throw ArgumentError("JSON data cannot be null");
    }
    return DisplayLogicModel(
      fieldId: json["fieldId"]??"",
      actionTaken: json["actionTaken"]??'',
      choiceId: json["choiceId"]??'',
      optionId: json["optionId"]??'',
      refValue: json["refValue"]??'',
      sequence: json["sequence"]??1,
    );
  }
}