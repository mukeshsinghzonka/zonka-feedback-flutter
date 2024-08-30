class ApplyTemplateParams{

final String? workSpaceId;
final String ?surveyId;
final String ? templateId;
// final List<String>? locationArray;
ApplyTemplateParams(this.workSpaceId, this.surveyId,this.templateId);

Map<String, dynamic> toJson() => {
  "workSpaceId":workSpaceId,
  "surveyId":surveyId,
  "templateId":templateId
};

}