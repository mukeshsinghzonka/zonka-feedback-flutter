import 'package:zonka_feedback/feedback/data/data_model_new/survey_model.dart';
import 'package:zonka_feedback/feedback/domain/repositories/survey_feedback_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';

class SurveyFeedbackUc extends UseCase<ApiResult<SurveyModel>,String> {

  final SurveyFeedbackRepo surveyFeedbackRepo;
  SurveyFeedbackUc({required  this.surveyFeedbackRepo});
  
  @override
  Future<ApiResult<SurveyModel>> call(String params) async {
    final response = await surveyFeedbackRepo.surveyFeedbackRepo(suveryId: params);
    return response;
  }

}