import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/survey_model.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_feedback_uc.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class SurveryApiFeedbackController extends BaseControllerWithParams<void, String> {
 late Rx<SurveyModel> _surveyModel;
 Rx<SurveyModel> get surveyModel => _surveyModel;
 void setSurveyModel(SurveyModel value) async {
    _surveyModel = Rx<SurveyModel>(value);      
    update();
  } 

  @override
  Future<void> call(String params) async {
    setStatus(ApiCallStatus.Loading);
    ApiResult<SurveyModel> response = await getIt.get<SurveyFeedbackUc>().call(params);
      response.when(success: (data)  {
      setStatus(ApiCallStatus.Success);
      setSurveyModel(data!);
      return;
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  }
}
