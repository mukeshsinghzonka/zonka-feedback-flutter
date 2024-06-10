import 'package:get_it/get_it.dart';
import 'package:zonka_feedback/login/data/data_source/login_ds.dart';
import 'package:zonka_feedback/login/data/repositories/login_repo_impl.dart';
import 'package:zonka_feedback/login/domain/repositories/login_repo.dart';
import 'package:zonka_feedback/login/domain/usecase/signup_user_uc.dart';
import 'package:zonka_feedback/login/presentation/manager/signup_controller.dart';
import 'package:zonka_feedback/services/logger/logger.dart';

final getIt = GetIt.instance;

void setup() {
    getIt..registerFactory(() => SignupController())
   
    //Use cases 
    ..registerLazySingleton(() => SignUpUserUC(getIt()))

    //Repository
    ..registerLazySingleton<LoginFeatureRepo>(() => LoginRepoImpl(getIt()))

    //Data Source
    ..registerLazySingleton(() => LoginUserDs());

    getIt.registerLazySingleton(() => LoggerService());

    
}