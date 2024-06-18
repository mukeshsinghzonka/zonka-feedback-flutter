import 'package:get_it/get_it.dart';
import 'package:zonka_feedback/login/data/data_source/login_ds.dart';
import 'package:zonka_feedback/login/data/repositories/login_repo_impl.dart';
import 'package:zonka_feedback/login/domain/repositories/login_repo.dart';
import 'package:zonka_feedback/login/domain/usecase/login_user_uc.dart';
import 'package:zonka_feedback/login/domain/usecase/signup_user_uc.dart';
import 'package:zonka_feedback/login/presentation/manager/login_controller.dart';
import 'package:zonka_feedback/login/presentation/manager/signup_controller.dart';
import 'package:zonka_feedback/services/logger/logger.dart';

final getIt = GetIt.instance;

void setup() {
    getIt.registerFactory(() => SignupController());
    getIt.registerFactory(() => LoginController());


    //Use cases 
    getIt.registerLazySingleton(() => SignUpUserUC(loginUserRepository:getIt()));
    getIt.registerLazySingleton(() => LoginUserUc(loginUserRepository:getIt()));


    //Repository
    getIt.registerLazySingleton<LoginFeatureRepo>(() => LoginRepoImpl(loginDataSource: getIt()));


    //Data Source
    getIt.registerLazySingleton(() => LoginUserDs());



    //Services
    getIt.registerLazySingleton(() => LoggerService());

    
}