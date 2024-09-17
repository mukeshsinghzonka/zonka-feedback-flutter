import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_submit_model.dart';
import 'package:zonka_feedback/feedback/data/data_source/network_ds/survey_submit_ds.dart';
import 'package:zonka_feedback/feedback/domain/repositories/survey_submit_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

class SurveySubmitRepoImpl extends SurveySubmitRepo {
  final SurveySubmitDs submitSurveyDs;
  SurveySubmitRepoImpl({required this.submitSurveyDs});

  @override
  Future<ApiResult<void>> surveySubmitRepo({required SurveySubmitModel suverySubmitModel}) async {
    return await submitSurveyDs.getSurveySubmitDs(suverySubmitModel: suverySubmitModel);
  }
}
