class SurveyResponse {
  final String? fieldId;
  final String ?fieldValue;
  final String ?choiceId;
  final String ?optionId;
  SurveyResponse({
     this.fieldId,
     this.fieldValue,
     this.choiceId,
     this.optionId,
  });

  Map<String, dynamic> toJsonSurveyReponse() {
    return {
      "fieldId": fieldId??"",
      "fieldValue": fieldValue??"",
      "choiceId": choiceId??"",
      "optionId": optionId??""
    };
  }
}
