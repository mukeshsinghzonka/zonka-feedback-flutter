import 'package:zonka_feedback/feedback/data/data_model_new/survey_model.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_feedback_uc.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class SurveryFeedbackController extends BaseControllerWithParams<void,String > {
  

  @override
  Future<void> call(String params) async {
    setStatus(ApiCallStatus.Loading);
    ApiResult<SurveyModel> response = await  getIt.get<SurveyFeedbackUc>().call(params);
    response.when(success: (data) async {
     setStatus(ApiCallStatus.Success);
     return;
    }, failure: (error) async {
    setStatus(ApiCallStatus.Error);
    setNetworkExceptions(error);
    });
  }

}