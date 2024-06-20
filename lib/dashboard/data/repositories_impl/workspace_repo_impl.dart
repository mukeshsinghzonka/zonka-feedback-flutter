
import 'package:zonka_feedback/dashboard/data/data_model/workspace_model.dart';
import 'package:zonka_feedback/dashboard/data/data_source/workspace_ds.dart';
import 'package:zonka_feedback/dashboard/domain/repositories/workspace_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

class WorkspaceRepoImpl extends WorkspaceRepo {
  final WorkspaceDataSource workspaceDataSource;
  WorkspaceRepoImpl({required this.workspaceDataSource});
  @override
  Future<ApiResult<List<WorkspaceModel>>> getWorkspaceList() async {
    return await workspaceDataSource.getWorkSpaceListDs();
  }
}