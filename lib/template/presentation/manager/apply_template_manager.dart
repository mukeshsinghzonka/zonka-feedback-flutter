import 'package:get/get.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/template/data/data_model/apply_template_params.dart';
import 'package:zonka_feedback/template/domain/usecase/apply_template_uc.dart';
import 'package:zonka_feedback/template/presentation/manager/add_template_manager.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class ApplyTemplateManagerController extends BaseControllerWithParams<void, ApplyTemplateParamsValue> {
 
  @override
  Future<void> call(ApplyTemplateParamsValue params) async {
    setStatus(ApiCallStatus.Loading);
    ApiResult<void> response = await getIt.get<ApplyTemplateUc>().call(ApplyTemplateParams(params.templateId ,params.surveyId));
    response.when(success: (data) async {
      setStatus(ApiCallStatus.Success);
      return;
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  }
}


class ApplyTemplateParamsValue{
  final String templateId;
  final String surveyId;
  ApplyTemplateParamsValue({required this.surveyId, required this.templateId});
}
