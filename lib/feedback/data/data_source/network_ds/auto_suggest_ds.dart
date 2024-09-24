import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';

class AutoSuggestDs {
  final HttpUtil _httpUtil = HttpUtil();

  Future<ApiResult<void>> getUsersListDs() async {
    try {
      final responseSurvey = await _httpUtil.get('/api/v1/locations/autosuggest');
      print("userslitreponse $responseSurvey");
      return ApiResult.success(data: "");
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
