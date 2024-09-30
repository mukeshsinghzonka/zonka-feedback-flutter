import 'package:zonka_feedback/feedback/data/data_model_new/survey_model.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

import '../../data/data_model_new/survey_data_model.dart';

abstract class SurveyFeedbackRepo {
  Future<ApiResult<SurveyDataModel>> surveyFeedbackRepo({required String? suveryId});
}