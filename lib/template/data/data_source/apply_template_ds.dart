import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';

class ApplyTemplateDs {

  final HttpUtil _httpUtil = HttpUtil();

  Future<ApiResult<void>> applyTemplateDs() async {
    try { 
      final response = await _httpUtil.post('/api/v1/surveys/applyTemplate');
      print(response);
      return ApiResult.success(data: "");
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}