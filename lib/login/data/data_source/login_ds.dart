import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/api_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';

class LoginUserDs {


Future<ApiResult<void>> loginUser({ String? email, String? password}) async {
  try {
    HttpUtil httpUtil = HttpUtil();
    final response = await httpUtil.get('/users');
    return ApiResult.success(data: response);
  } catch (e) {
    return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  }
}


Future<ApiResult<void>> signupUser({ String? email, String? password}) async {
  try {
    HttpUtil httpUtil = HttpUtil();
    final response = await httpUtil.get('/users');
    return ApiResult.success(data: response);
  } catch (e) {
    return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  }
}



}