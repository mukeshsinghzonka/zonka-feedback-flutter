import 'package:zonka_feedback/login/data/data_model/login_response/login_response.dart';
import 'package:zonka_feedback/login/data/data_model/signup_body_model.dart';
import 'package:zonka_feedback/login/domain/repositories/login_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';

class SignUpUserUC extends UseCase<ApiResult<LoginResponse>, SignUpBodyModel>{
  final LoginFeatureRepo loginUserRepository;
  SignUpUserUC({required this.loginUserRepository});
  
  @override
  Future<ApiResult<LoginResponse>> call(SignUpBodyModel? params) async {
    return await loginUserRepository.signupUser(signupBodyModel: params);
  }
  
}