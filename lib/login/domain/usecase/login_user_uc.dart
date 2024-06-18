

import 'package:zonka_feedback/login/data/data_model/login_response/login_response.dart';
import 'package:zonka_feedback/login/data/data_model/signin_body_model.dart';
import 'package:zonka_feedback/login/domain/repositories/login_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';


class LoginUserUc extends UseCase<ApiResult<LoginResponse>, SignInBodyModel>{

  final LoginFeatureRepo loginUserRepository;
  LoginUserUc({required this.loginUserRepository});

  @override
  Future<ApiResult<LoginResponse>> call(SignInBodyModel params) async{
    return await loginUserRepository.loginUser(signInBodyModel: params);
  }

}