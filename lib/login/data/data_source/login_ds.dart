import 'dart:convert';

import 'package:zonka_feedback/login/data/data_model/signup_body_model.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/api_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';

class LoginUserDs {
HttpUtil httpUtil = HttpUtil();

Future<ApiResult<void>> loginUser({ String? email, String? password}) async {
  try {
    final response = await httpUtil.get('/users');
    return ApiResult.success(data: response);
  } catch (e) {
    return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  }
}

Future<ApiResult<void>> signupUser({SignUpBodyModel ? signupBodyModel}) async {
  try {
   
    final response = await httpUtil.post('/api/v1/api2',data:jsonEncode(signupBodyModel!.toJsonAndroid()));
    return const ApiResult.success(data: "",);
  } catch (e) {
    return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  }
}
}