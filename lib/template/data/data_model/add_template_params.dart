class AddTemplateParams{
  final String ? workSpaceId;
  final String ? surveyName;
AddTemplateParams({
  required this.workSpaceId,
  required this.surveyName
});
Map<String, dynamic> toJson() => {

  "workSpaceId":workSpaceId,
  "surveyName":surveyName
};



}