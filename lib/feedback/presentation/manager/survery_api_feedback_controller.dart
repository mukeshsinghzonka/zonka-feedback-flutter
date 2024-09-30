import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/survey_model.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_feedback_uc.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

import '../../data/data_model_new/survey_data_model.dart';

class SurveryApiFeedbackController extends BaseControllerWithParams<void, String> {



 late Rx<SurveyDataModel> _surveyDataModel;
 Rx<SurveyDataModel> get surveyDataModel => _surveyDataModel;
 void setSurveyDataModel(SurveyDataModel value) async {
   _surveyDataModel = Rx<SurveyDataModel>(value);
   update();
 }



  @override
  Future<void> call(String params) async {
    setStatus(ApiCallStatus.Loading);
    ApiResult<SurveyDataModel> response = await getIt.get<SurveyFeedbackUc>().call(params);
      response.when(success: (data)  {
      setSurveyDataModel(data!);
      setStatus(ApiCallStatus.Success);
      return;
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  }
}
