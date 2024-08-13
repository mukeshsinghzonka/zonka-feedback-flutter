import 'package:get_it/get_it.dart';
import 'package:zonka_feedback/feedback/data/data_source/selected_languaga_ds.dart';
import 'package:zonka_feedback/feedback/data/data_source/survey_feedback_ds.dart';
import 'package:zonka_feedback/feedback/data/data_source/survey_image_upload_ds.dart';
import 'package:zonka_feedback/feedback/data/repositories/selected_language_repo_impl.dart';
import 'package:zonka_feedback/feedback/data/repositories/survery_image_upload_image_repo_impl.dart';
import 'package:zonka_feedback/feedback/data/repositories/survey_feedback_repo_impl.dart';
import 'package:zonka_feedback/feedback/domain/repositories/selected_language_repo.dart';
import 'package:zonka_feedback/feedback/domain/repositories/survey_feedback_repo.dart';
import 'package:zonka_feedback/feedback/domain/repositories/survey_image_upload_feedback_repo.dart';
import 'package:zonka_feedback/feedback/domain/usecase/selected_language_uc.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_feedback_uc.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_image_upload_uc.dart';
import 'package:zonka_feedback/location/data/data_source/location_ds.dart';
import 'package:zonka_feedback/dashboard/data/data_source/workspace_ds.dart';
import 'package:zonka_feedback/location/data/repositories_impl/location_repo_impl.dart';
import 'package:zonka_feedback/dashboard/data/repositories_impl/workspace_repo_impl.dart';
import 'package:zonka_feedback/location/domain/repositories/location_repo.dart';
import 'package:zonka_feedback/dashboard/domain/repositories/workspace_repo.dart';
import 'package:zonka_feedback/location/domain/usecase/location_uc.dart';
import 'package:zonka_feedback/dashboard/domain/usecase/workspace_uc.dart';
import 'package:zonka_feedback/location/presentation/manager/location_controller.dart';
import 'package:zonka_feedback/login/data/data_source/login_ds.dart';
import 'package:zonka_feedback/login/data/repositories/login_repo_impl.dart';
import 'package:zonka_feedback/login/domain/repositories/login_repo.dart';
import 'package:zonka_feedback/login/domain/usecase/login_user_uc.dart';
import 'package:zonka_feedback/login/domain/usecase/signup_user_uc.dart';
import 'package:zonka_feedback/login/presentation/manager/login_controller.dart';
import 'package:zonka_feedback/login/presentation/manager/signup_controller.dart';
import 'package:zonka_feedback/services/logger/logger.dart';
import 'package:zonka_feedback/surveys/data/data_source/survey_ds.dart';
import 'package:zonka_feedback/surveys/data/repositories_impl/survey_repo_impl.dart';
import 'package:zonka_feedback/surveys/domain/repositories/survey_repo.dart';
import 'package:zonka_feedback/surveys/domain/usecase/survey_uc.dart';

final getIt = GetIt.instance;

void setup() {
    getIt.registerFactory(() => SignupController());
    getIt.registerFactory(() => LoginController());
    getIt.registerFactory(() => LocationController());


    //Use cases 
    getIt.registerLazySingleton(() => SignUpUserUC(loginUserRepository:getIt()));
    getIt.registerLazySingleton(() => LoginUserUc(loginUserRepository:getIt()));
    getIt.registerLazySingleton(() => LocationUc(locationRepo:getIt()));
    getIt.registerLazySingleton(() => WorkspaceUc(workspaceRepo:getIt())); 
    getIt.registerLazySingleton(() => SurveyUseCase(surveyRepository:getIt())); 
    getIt.registerLazySingleton(() => SurveyFeedbackUc(surveyFeedbackRepo:getIt()));
    getIt.registerLazySingleton(() => SurveyImageUploadUc(imageUploadFeedRepo:getIt()));
    getIt.registerLazySingleton(() => SelectedLanguageUc(selectedLanguageRepo:getIt()));

    // getIt.registerLazySingleton(() => SurveyLanguagesUc(surveyFeedbackRepo:getIt())); 


    //Repository
    getIt.registerLazySingleton<LoginFeatureRepo>(() => LoginRepoImpl(loginDataSource: getIt()));
    getIt.registerLazySingleton<LocationRepo>(() => LocationRepoImpl(locationDataSource: getIt()));
    getIt.registerLazySingleton<WorkspaceRepo>(() => WorkspaceRepoImpl(workspaceDataSource: getIt()));
    getIt.registerLazySingleton<SurveyRepository>(() => SurveyRepoImpl(surveyDataSource: getIt()));
    getIt.registerLazySingleton<SurveyFeedbackRepo>(() => SurveyFeedbackRepoImpl(surveyFeedBackDataSource: getIt()));
    getIt.registerLazySingleton<ImageUploadFeedRepo>(() => SurveryImageUploadImageRepoImpl(surveyImageUploadDs: getIt()));
    getIt.registerLazySingleton<SelectedLanguageRepo>(() => SelectedLanguageRepoImpl(selectedLanguagaDs: getIt()));
 



    //Data Source
    getIt.registerLazySingleton(() => LoginUserDs());
    getIt.registerLazySingleton(() => LocationDataSource());
    getIt.registerLazySingleton(() => WorkspaceDataSource());
    getIt.registerLazySingleton(() => SurveyDataSource());
    getIt.registerLazySingleton(() => SurveyFeedBackDataSource());
    getIt.registerLazySingleton(() => SurveyImageUploadDs());
    getIt.registerLazySingleton(() => SelectedLanguagaDs());
  

    //Services
    getIt.registerLazySingleton(() => LoggerService());

    
}