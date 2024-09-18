import 'package:zonka_feedback/dashboard/data/data_model/workspace_model.dart';
import 'package:zonka_feedback/dashboard/data/data_source/local_network/workspace_local_ds.dart';
import 'package:zonka_feedback/dashboard/data/data_source/network_ds/workspace_ds.dart';
import 'package:zonka_feedback/dashboard/domain/repositories/workspace_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_connectivity.dart';

class WorkspaceRepoImpl extends WorkspaceRepo {
  final WorkspaceDataSource workspaceDataSource;
  final WorkspaceLocalDs workspaceLocalDs;
  NetworkConnectivity networkConnectivity = NetworkConnectivity();
  WorkspaceRepoImpl(
      {required this.workspaceDataSource, required this.workspaceLocalDs});
  @override
  Future<ApiResult<List<WorkspaceModel>>> getWorkspaceList() async {
    bool isConnected = await networkConnectivity.isConnected();
      print("workspalcelocal $isConnected");
    if (isConnected) {
      return await workspaceDataSource.getWorkSpaceListDs();
    } else {
      return await workspaceLocalDs.getWorkSpaceLocalListDs();
    }
  }
}
