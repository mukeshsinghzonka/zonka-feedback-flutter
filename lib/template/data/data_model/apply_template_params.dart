class ApplyTemplateParams{

final String? workSpaceId;
final String ?surveyName;
final String ? templateId;
// final List<String>? locationArray;
ApplyTemplateParams(this.workSpaceId, this.surveyName,this.templateId);

Map<String, dynamic> toJson() => {
  "workSpaceId":workSpaceId,
  "surveyId":surveyName,
  "templateId":templateId
};

}