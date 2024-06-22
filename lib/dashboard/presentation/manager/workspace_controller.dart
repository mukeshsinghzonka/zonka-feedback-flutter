import 'package:zonka_feedback/dashboard/data/data_model/workspace_model.dart';
import 'package:zonka_feedback/dashboard/domain/usecase/workspace_uc.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class WorkspaceController extends BaseControllerWithOutParams<void>{
  
  WorkspaceModel ? _selectedWorkspace;
  WorkspaceModel ? get selectedWorkspace => _selectedWorkspace;
  void setSelectedWorkspace(WorkspaceModel ?selectedWorkspace) {
    _selectedWorkspace = selectedWorkspace;
    update();
  }


  List<WorkspaceModel> _workspaceList = [];
  List<WorkspaceModel> get workspaceList => _workspaceList;
  void setWorkspaceList(List<WorkspaceModel> ?workspaceList) {
    _workspaceList = workspaceList??[];
    update();
  }

  @override
  Future<void> call() async {
      setStatus(ApiCallStatus.Loading);
      ApiResult<List<WorkspaceModel>> result = await getIt.get<WorkspaceUc>().call();
      result.when(success: (data) async {
      setStatus(ApiCallStatus.Success);
      setWorkspaceList(data);
      if(data!.isNotEmpty){
        setSelectedWorkspace(data.first);
      }
      return;
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  }
  
}