import 'package:zonka_feedback/dashboard/data/data_model/workspace_model.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

class WorkspaceDataSource{

final HttpUtil _httpUtil = HttpUtil();

Future<ApiResult<List<WorkspaceModel>>> getWorkSpaceListDs() async {
    try {
      List<WorkspaceModel> workspaceData = [];
      final response = await _httpUtil.get('/api/v1/surveys/getWorkspaces');
      List workspace  = response["data"]["workSpaceMap"];
      for (var i in workspace) {
        workspaceData.add(WorkspaceModel.fromJson(i));
      }
      await HiveService().putData(HiveDirectoryUtil.workSpaceModelBox, HiveKey.workSpaceKey, workspaceData);
      return ApiResult.success(data: workspaceData);
    }
     catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

}