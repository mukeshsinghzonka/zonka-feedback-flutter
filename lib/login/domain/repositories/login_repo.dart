

import 'package:zonka_feedback/login/data/data_model/signin_body_model.dart';
import 'package:zonka_feedback/login/data/data_model/signup_body_model.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

abstract class LoginFeatureRepo {
  Future<ApiResult<void>> loginUser({ required SignInBodyModel ? signInBodyModel});
  Future<ApiResult<void>> signupUser({required SignUpBodyModel ? signupBodyModel});
}