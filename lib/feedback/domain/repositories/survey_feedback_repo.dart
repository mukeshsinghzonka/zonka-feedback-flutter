import 'package:zonka_feedback/feedback/data/data_model_new/survey_model.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

abstract class SurveyFeedbackRepo {
  Future<ApiResult<SurveyModel>> surveyFeedbackRepo({required String? suveryId});
}