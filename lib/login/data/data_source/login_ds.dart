import 'dart:convert';

import 'package:zonka_feedback/login/data/data_model/signup_body_model.dart';
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

Future<ApiResult<void>> signupUser({SignUpBodyModel ? signupBodyModel}) async {
  try {
    HttpUtil httpUtil = HttpUtil();
    final response = await httpUtil.post('/api/v1/signup',data:jsonEncode(signupBodyModel!.toJson()) );    
    print("signupuserpostresponse $response");
    return const ApiResult.success(data: "",);
  } catch (e) {
    print("singupuserexceotion $e");
    return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  }
}

}