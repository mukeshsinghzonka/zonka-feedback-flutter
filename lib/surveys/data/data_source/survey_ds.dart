import 'dart:convert';

import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_res_model.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_req_model.dart';

class SurveyDataSource {
  final HttpUtil _httpUtil = HttpUtil();

  Future<ApiResult<List<SurveyResModel>>> getSurveysDs({required List<SurveyReqModel> params}) async {
    try {
      print("getsurveyreponse ${params.map((model) => model.toJson()).toList()}");
      final response = await _httpUtil.post('/api/v1/surveys/surveyByLocationsAndUsers',data:jsonEncode(params.map((model) => model.toJson()).toList()) );
      print("getsurveyreponse $response");
      return ApiResult.success(data: response);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
