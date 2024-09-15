import 'dart:convert';

import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_submit_model.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';

class SurveySubmitDs {
  final HttpUtil _httpUtil = HttpUtil();

  Future<ApiResult<bool>> getSurveySubmitDs({required SurveySubmitModel suverySubmitModel}) async {
    try {
      print("reponseSurvey ${jsonEncode({"response": suverySubmitModel.toJsonSurveySubmit()})}");
      final responseSurvey = await _httpUtil.post('/api/v1/responses/add',data: jsonEncode({"response": suverySubmitModel.toJsonSurveySubmit()}));
      print("reponseSurvey $responseSurvey");
      return ApiResult.success(data: true);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
