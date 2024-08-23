import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_submit_model.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_submit_uc.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class SubmitSurveyManagerController
    extends BaseControllerWithParams<void, SurveySubmitModel> {
//    late Rx<SurveyModel> _surveyModel;
//  Rx<SurveyModel> get surveyModel => _surveyModel;
//  void setSurveyModel(SurveyModel value) async {
//     _surveyModel = Rx<SurveyModel>(value);
//     update();
//   }

  @override
  Future<void> call(SurveySubmitModel params) async {
    setStatus(ApiCallStatus.Loading);
    ApiResult<void> response = await getIt.get<SurveySubmitUc>().call(params);
    response.when(success: (data) {
      setStatus(ApiCallStatus.Success);
      return;
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  }
}
