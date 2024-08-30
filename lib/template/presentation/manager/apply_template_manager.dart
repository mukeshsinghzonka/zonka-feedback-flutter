import 'package:get/get.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/workspace_controller.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/template/data/data_model/add_template_model.dart';
import 'package:zonka_feedback/template/data/data_model/apply_template_params.dart';
import 'package:zonka_feedback/template/domain/usecase/add_template_uc.dart';
import 'package:zonka_feedback/template/domain/usecase/apply_template_uc.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class ApplyTemplateManagerController extends BaseControllerWithParams<void,ParamsValue> {

  final  workspaceController  = Get.find<WorkspaceController>();  

  @override
  Future<void> call(ParamsValue  params) async {
    setStatus(ApiCallStatus.Loading);
    ApiResult<AddTemplateModel> addTemplateresponse = await getIt.get<AddTemplateUc>().call();
    addTemplateresponse.when(success: (data)async {

  ApiResult<void> response = await getIt.get<ApplyTemplateUc>().call(ApplyTemplateParams(workspaceController.selectedWorkspace!.workSpaceId, params.templateId,data!.id??"" ));
    response.when(success: (data) async {
      setStatus(ApiCallStatus.Success);
      return;
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  
  }
}


class ParamsValue{
  final String surveyId;
  final String templateId;
ParamsValue({
  required this.surveyId,
  required this.templateId
});
}