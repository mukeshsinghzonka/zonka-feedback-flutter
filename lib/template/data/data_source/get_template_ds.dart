import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';

class  GetAllTemplateDs {

  
  final HttpUtil _httpUtil = HttpUtil();
  Future<ApiResult<void>> getAllTemplateDs() async {
    try { 
      final response = await _httpUtil.get('/api/v1/surveys/templates');
      print(response);
      return ApiResult.success(data: "");
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

}