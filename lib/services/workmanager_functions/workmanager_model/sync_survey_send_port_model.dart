class SyncSurveyPortModel {
  final DateTime dateTime;
  final String surveyId;

  SyncSurveyPortModel({required this.dateTime, required this.surveyId});

  // Method to convert the object to a JSON-compatible map
  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime.toIso8601String(), // Convert DateTime to string
      'surveyId': surveyId,
    };
  }
  factory SyncSurveyPortModel.fromJson(Map<String, dynamic> json) {
    return SyncSurveyPortModel(
      dateTime: DateTime.parse(json['dateTime']), // Parse DateTime from string
      surveyId: json['surveyId'],
    );
  }
}