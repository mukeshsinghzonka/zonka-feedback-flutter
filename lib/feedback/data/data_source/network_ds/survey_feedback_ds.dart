import 'package:zonka_feedback/feedback/data/data_model_new/survey_model.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
class SurveyFeedBackDataSource {
  final HttpUtil _httpUtil = HttpUtil();

  Future<ApiResult<SurveyModel>> getSurveyFeedBackDs({required String? suveryId}) async {
    try {
      final responseSurvey = await _httpUtil.get('/api/v1/surveys/download/$suveryId');
      SurveyModel surveyFeedBackModel = SurveyModel.fromJson(responseSurvey['data']['survey']);
      return ApiResult.success(data:surveyFeedBackModel);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  
}
