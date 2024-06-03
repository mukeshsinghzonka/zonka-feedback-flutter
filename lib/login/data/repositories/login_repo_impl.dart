

import 'package:zonka_feedback/login/data/data_model/signup_body_model.dart';
import 'package:zonka_feedback/login/data/data_source/login_ds.dart';
import 'package:zonka_feedback/login/domain/repositories/login_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

class LoginRepoImpl implements LoginFeatureRepo {

  final LoginUserDs loginDataSource;
  LoginRepoImpl(this.loginDataSource);

  @override
  Future<ApiResult<void>> loginUser({String? email, String? password}) {
     return loginDataSource.loginUser(email: email, password: password);
  }

  @override
  Future<ApiResult<void>> signupUser({required SignUpBodyModel ? signupBodyModel}) {
    return loginDataSource.signupUser(signupBodyModel: signupBodyModel);
  }
 
}