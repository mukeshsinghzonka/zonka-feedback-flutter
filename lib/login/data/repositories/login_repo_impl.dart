

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
  Future<ApiResult<void>> signupUser({String? email, String? password, String? name, String? companyName}) {
    // TODO: implement signupUser
    throw UnimplementedError();
  }
  // final LoginDataSource loginDataSource;

  // LoginRepoImpl({required this.loginDataSource});

  // @override
  // Future<Either<Failure, LoginResponse>> login(LoginRequest loginRequest) async {
  //   try {
  //     final response = await loginDataSource.login(loginRequest);
  //     return Right(response);
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.message));
  //   } on CacheException catch (e) {
  //     return Left(CacheFailure(e.message));
  //   }
  // }
}