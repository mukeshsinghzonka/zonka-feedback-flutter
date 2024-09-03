import 'package:equatable/equatable.dart';

class WorkspaceModel extends Equatable{
  
  final String workSpaceId;
  final String workSpaceName;
  final String companyId;
  final bool widgetCodeInstalled;
  final bool isFirstWorkspace;
  final String modifiedByName;

  const WorkspaceModel({
    required this.workSpaceId,
    required this.workSpaceName,
    required this.companyId,
    required this.isFirstWorkspace,
    required this.widgetCodeInstalled,
    required this.modifiedByName,
  });
  


  factory WorkspaceModel.fromJson(Map<String, dynamic> json) {
    return WorkspaceModel(
      workSpaceId: json['_id']??"",
      workSpaceName: json['workSpaceName']??"Workspace",
      companyId: json['companyId']??"",
      isFirstWorkspace: json['isFirstWorkspace']??false,
      widgetCodeInstalled: json['widgetCodeInstalled']??false,
      modifiedByName: json['modifiedByName']??"",
    );
  }
  
  @override
  List<Object?> get props => [
    workSpaceId,
    workSpaceName,
    companyId,
    isFirstWorkspace,
    widgetCodeInstalled,
    modifiedByName
  ];
}