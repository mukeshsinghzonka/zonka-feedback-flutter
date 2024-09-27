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
    response.when(success: (data)async {
      dynamic count = await HiveService().getData(HiveDirectoryUtil.totalSurveyResponseCount, params.surveyId??"");
      await HiveService().putData(HiveDirectoryUtil.totalSurveyResponseCount, params.surveyId??"",count == null? 1: count + 1);

      setStatus(ApiCallStatus.Success);

      return;
    }, failure: (error) async {
      await HiveService().addData(HiveDirectoryUtil.submitSurveyBox, params);
      dynamic count = await HiveService().getData(HiveDirectoryUtil.surveyUnsyncResponseCount, params.surveyId??"");
      await HiveService().putData(HiveDirectoryUtil.surveyUnsyncResponseCount, params.surveyId??"",count == null? 1: count + 1);
      dynamic countTotal = await HiveService().getData(HiveDirectoryUtil.totalSurveyResponseCount, params.surveyId??"");
      await HiveService().putData(HiveDirectoryUtil.totalSurveyResponseCount, params.surveyId??"",countTotal == null? 1: countTotal + 1);

      setStatus(ApiCallStatus.Error);
    });
  }
}
