import 'package:get/get.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/workspace_controller.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/template/data/data_model/add_template_model.dart';
import 'package:zonka_feedback/template/data/data_model/add_template_params.dart';
import 'package:zonka_feedback/template/domain/usecase/add_template_uc.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class AddTemplateManagerController extends BaseControllerWithParams<void,AddTemplateParamsValue> {

  final workspaceController  = Get.find<WorkspaceController>();  

  late Rx<AddTemplateModel> _addTemplateModel;
  Rx<AddTemplateModel> get addTemplateModel => _addTemplateModel;
   void addTemplateModelFunct(AddTemplateModel value) {
    _addTemplateModel = value.obs;
    update();
  }

  @override
  Future<void> call(AddTemplateParamsValue  params) async {
    setStatus(ApiCallStatus.Loading);
    ApiResult<AddTemplateModel> addTemplateresponse = await getIt.get<AddTemplateUc>().call(
      AddTemplateParams(surveyName: params.surveyName, workSpaceId: workspaceController.selectedWorkspace!.value.workSpaceId)
    );
    addTemplateresponse.when(success: (data) async {
    addTemplateModelFunct(data!);
    setStatus(ApiCallStatus.Success);
    },
    failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  
  }
}


class AddTemplateParamsValue{

  final String templateId;
  final String surveyName;
AddTemplateParamsValue({

  required this.templateId,
  required this.surveyName
});
}