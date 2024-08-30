class ApplyTemplateParams{


final String ?surveyId;
final String ? templateId;
// final List<String>? locationArray;
ApplyTemplateParams(this.surveyId,this.templateId);

Map<String, dynamic> toJson() => {

  "surveyId":surveyId,
  "templateId":templateId
};

}