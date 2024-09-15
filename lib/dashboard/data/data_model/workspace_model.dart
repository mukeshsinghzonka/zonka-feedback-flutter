import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';
part 'workspace_model.g.dart';

@HiveType(typeId: HiveTypeId.workspaceModelId)
class WorkspaceModel extends Equatable {
  
  @HiveField(0)
  final String workSpaceId;

  @HiveField(1)
  final String workSpaceName;

  @HiveField(2)
  final String companyId;

  @HiveField(3)
  final bool widgetCodeInstalled;

  @HiveField(4)
  final bool isFirstWorkspace;

  @HiveField(5)
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
      workSpaceId: json['_id'] ?? "",
      workSpaceName: json['workSpaceName'] ?? "Workspace",
      companyId: json['companyId'] ?? "",
      isFirstWorkspace: json['isFirstWorkspace'] ?? false,
      widgetCodeInstalled: json['widgetCodeInstalled'] ?? false,
      modifiedByName: json['modifiedByName'] ?? "",
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      '_id': workSpaceId,
      'workSpaceName': workSpaceName,
      'companyId': companyId,
      'isFirstWorkspace': isFirstWorkspace,
      'widgetCodeInstalled': widgetCodeInstalled,
      'modifiedByName': modifiedByName,
    };
  }

  @override
  List<Object?> get props => [
    workSpaceId,
    workSpaceName,
    companyId,
    isFirstWorkspace,
    widgetCodeInstalled,
    modifiedByName,
  ];
}
