import 'dart:convert';
import 'package:zonka_feedback/login/data/data_model/login_response/login_response.dart';
import 'package:zonka_feedback/login/data/data_model/signin_body_model.dart';
import 'package:zonka_feedback/login/data/data_model/signup_body_model.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

class LoginUserDs {
  HttpUtil httpUtil = HttpUtil();

  Future<ApiResult<LoginResponse>> loginUser(
      {required SignInBodyModel? signInBodyModel}) async {
    try {
      httpUtil.changeDioUrl(urlType: SetBaseUrl.LOGIN);
      final response = await httpUtil.post('/api/v1/login',
          data: jsonEncode(signInBodyModel!.toJsonAndroid()));
      LoginResponse value = LoginResponse.fromJson(response["data"]);
      await HiveService()
          .putData(HiveDirectoryUtil.loginBox, HiveKey.loginUser, value);
      await value.save();
      return ApiResult.success(data: value);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<LoginResponse>> signupUser({SignUpBodyModel? signupBodyModel}) async {
    try {
      bool value = await checkEmail(email: signupBodyModel!.email);
      if (value) {
        httpUtil.changeDioUrl(urlType:signupBodyModel.region == 'US' ? SetBaseUrl.US : SetBaseUrl.EU);
        final response = await httpUtil.post('/api/v1/signup',data: jsonEncode(signupBodyModel.toJsonAndroid()));
        LoginResponse value = LoginResponse.fromJson(response["data"]);
        await HiveService()
            .putData(HiveDirectoryUtil.loginBox, HiveKey.loginUser, value);
        await value.save();
        return ApiResult.success(data: value);
      } else {
        return const ApiResult.failure(
            error: NetworkExceptions.defaultError("Email already exist"));
      }
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<bool> checkEmail({String? email}) async {
    try {
      httpUtil.changeDioUrl(urlType: SetBaseUrl.EMAIL);
      final response = await httpUtil.get('/api/v1/emailexist/$email');
      return response["success"];
    } catch (e) {
      return false;
    }
  }
}
