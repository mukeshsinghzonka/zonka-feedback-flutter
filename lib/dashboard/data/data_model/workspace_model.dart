class WorkspaceModel{
  
  final String id;
  final String workSpaceName;
  final String companyId;
  final bool widgetCodeInstalled;
  final bool isFirstWorkspace;
  final String modifiedByName;

  WorkspaceModel({
    required this.id,
    required this.workSpaceName,
    required this.companyId,
    required this.isFirstWorkspace,
    required this.widgetCodeInstalled,
    required this.modifiedByName,
  });
  


  factory WorkspaceModel.fromJson(Map<String, dynamic> json) {
    return WorkspaceModel(
      id: json['_id']??"",
      workSpaceName: json['workSpaceName']??"",
      companyId: json['companyId']??"",
      isFirstWorkspace: json['isFirstWorkspace']??false,
      widgetCodeInstalled: json['widgetCodeInstalled']??false,
      modifiedByName: json['modifiedByName']??"",
    );
  }
}