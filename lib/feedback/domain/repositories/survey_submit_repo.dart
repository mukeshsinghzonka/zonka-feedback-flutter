

import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_submit_model.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

abstract class SurveySubmitRepo{
   Future<ApiResult<void>> surveySubmitRepo({required SurveySubmitModel suverySubmitModel});
}