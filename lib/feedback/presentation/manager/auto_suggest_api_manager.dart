import 'package:zonka_feedback/feedback/domain/usecase/auto_suggest_uc.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class AutoSuggestApiManager extends BaseControllerWithOutParams<void> {

  
  @override
  Future<void> call() async {
    setStatus(ApiCallStatus.Loading);
    ApiResult<void> response = await getIt.get<AutoSuggestUc>().call();
    response.when(success: (data) {
      setStatus(ApiCallStatus.Success);
      return;
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  }
}
