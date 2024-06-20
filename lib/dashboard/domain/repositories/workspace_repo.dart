import 'package:zonka_feedback/dashboard/data/data_model/workspace_model.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

abstract class WorkspaceRepo {
  Future<ApiResult<List<WorkspaceModel>>> getWorkspaceList();
}