class ApplyTemplateParams{


final String ?surveyId;
final String ? templateId;
ApplyTemplateParams(this.surveyId,this.templateId);

Map<String, dynamic> toJson() => {

  "surveyId":surveyId,
  "templateId":templateId
};

}