import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_submit_model.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_submit_uc.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';

class SubmitSurveyManagerController extends BaseControllerWithParams<void, SurveySubmitModel> {



  @override
  Future<void> call(SurveySubmitModel params) async {
    setStatus(ApiCallStatus.Loading);
    ApiResult<void> response = await getIt.get<SurveySubmitUc>().call(params);
    response.when(success: (data) {
      setStatus(ApiCallStatus.Success);
      return;
    }, failure: (error) async {
      await HiveService().addData(HiveDirectoryUtil.submitSurveyBox, params);
      setStatus(ApiCallStatus.Error);
      // setNetworkExceptions(error);
    });
  }
}
