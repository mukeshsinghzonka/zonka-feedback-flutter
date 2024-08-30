import 'dart:convert';

import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/template/data/data_model/apply_template_params.dart';

class ApplyTemplateDs {

  final HttpUtil _httpUtil = HttpUtil();

  Future<ApiResult<void>> applyTemplateDs({required ApplyTemplateParams applyTemplate}) async {
    try {
      
      final response = await _httpUtil.post('/api/v1/surveys/applyTemplate',
      data: jsonEncode(applyTemplate.toJson())
      );
      print("aaplytemplatemanagecontroller ${response} ${applyTemplate.toJson()}");
      return ApiResult.success(data: "");
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}