import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

import '../../data_model/workspace_model.dart';

class WorkspaceLocalDs {

  Future<ApiResult<List<WorkspaceModel>>> getWorkSpaceLocalListDs() async {
    try {
        print("workspalcelocal ");
     var value = await HiveService().getData(HiveDirectoryUtil.workSpaceModelBox, HiveKey.workSpaceKey);
    print("workspalcelocal $value");
 List<WorkspaceModel> workspaceList =[];
  if (value != null) {
        // Assuming 'value' is already a List<WorkspaceModel>, no need to deserialize
        workspaceList = List<WorkspaceModel>.from(value);
      }
print("workspalcelocal $workspaceList");
      return ApiResult.success(data: workspaceList);
    }
     catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

}
