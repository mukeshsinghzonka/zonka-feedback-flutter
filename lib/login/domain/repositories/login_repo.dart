

import 'package:zonka_feedback/services/network/api_result.dart';

abstract class LoginFeatureRepo {
  Future<ApiResult<void>> loginUser({String? email, String? password});
  Future<ApiResult<void>> signupUser({String? email, String? password, String? name, String? companyName});
}