import 'package:zonka_feedback/login/data/data_model/signup_body_model.dart';
import 'package:zonka_feedback/login/domain/repositories/login_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';

class SignUpUserUC extends UseCase<ApiResult<void>, SignUpBodyModel>{
  final LoginFeatureRepo _loginUserRepository;
  SignUpUserUC(this._loginUserRepository);
  
  @override
  Future<ApiResult<void>> call(SignUpBodyModel? params) async {
    return await _loginUserRepository.signupUser(signupBodyModel: params);
  }
  
  // @override
  // Future<ApiResult<ApiResult<void>>?> call(SignUpBodyModel? params) async {
  
  //    return await _loginUserRepository.signupUser(signupBodyModel: params);
  // }
  
  // @override
  // Future<ApiResult<void>> call({SignUpBodyModel? params}) async {
  //    return await _loginUserRepository.signupUser(signupBodyModel: params);
  // }

}