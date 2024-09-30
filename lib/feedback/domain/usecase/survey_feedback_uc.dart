import 'package:zonka_feedback/feedback/data/data_model_new/survey_model.dart';
import 'package:zonka_feedback/feedback/domain/repositories/survey_feedback_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';

import '../../data/data_model_new/survey_data_model.dart';

class SurveyFeedbackUc extends UseCase<ApiResult<SurveyDataModel>,String> {

  final SurveyFeedbackRepo surveyFeedbackRepo;
  SurveyFeedbackUc({required  this.surveyFeedbackRepo});
  
  @override
  Future<ApiResult<SurveyDataModel>> call(String params) async {
    final response = await surveyFeedbackRepo.surveyFeedbackRepo(suveryId: params);
    return response;
  }

}