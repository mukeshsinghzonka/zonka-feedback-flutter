import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/template/domain/usecase/get_template_uc.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

import '../../../services/get_it/get_it.dart';

class GetTemplateManager extends BaseControllerWithOutParams<void> {

  

  @override
  Future<void> call() async {
    setStatus(ApiCallStatus.Loading);
    ApiResult<void> response = await getIt.get<GetTemplateUc>().call();
    response.when(success: (data) async {
      setStatus(ApiCallStatus.Success);
      return;
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  }
}
