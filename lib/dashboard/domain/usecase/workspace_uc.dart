import 'package:zonka_feedback/dashboard/data/data_model/workspace_model.dart';
import 'package:zonka_feedback/dashboard/domain/repositories/workspace_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';

class WorkspaceUc extends UseCaseNoParams<ApiResult<List<WorkspaceModel>>> {
  final WorkspaceRepo workspaceRepo;
  WorkspaceUc({required this.workspaceRepo});

  @override
  Future<ApiResult<List<WorkspaceModel>>> call() async {
    return await workspaceRepo.getWorkspaceList();
  }
}