import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_it/get_it.dart';
import 'package:zonka_feedback/bottomnavigation/data/data_source/update_survey_ds.dart';
import 'package:zonka_feedback/bottomnavigation/data/repo_impl/update_survey_repo_impl.dart';
import 'package:zonka_feedback/bottomnavigation/domain/repositories/update_survey_repo.dart';
import 'package:zonka_feedback/bottomnavigation/domain/usecase/update_survey_uc.dart';
import 'package:zonka_feedback/dashboard/data/data_source/local_network/workspace_local_ds.dart';
import 'package:zonka_feedback/feedback/data/data_source/local_ds/selected_local_language_ds.dart';
import 'package:zonka_feedback/feedback/data/data_source/local_ds/survey_feedback_local_ds.dart';
import 'package:zonka_feedback/feedback/data/data_source/network_ds/auto_suggest_ds.dart';
import 'package:zonka_feedback/feedback/data/data_source/network_ds/selected_languaga_ds.dart';
import 'package:zonka_feedback/feedback/data/data_source/network_ds/survey_feedback_ds.dart';
import 'package:zonka_feedback/feedback/data/data_source/network_ds/survey_image_upload_ds.dart';
import 'package:zonka_feedback/feedback/data/data_source/network_ds/survey_submit_ds.dart';
import 'package:zonka_feedback/feedback/data/repositories/auto_suggest_repo_impl.dart';
import 'package:zonka_feedback/feedback/data/repositories/selected_language_repo_impl.dart';
import 'package:zonka_feedback/feedback/data/repositories/survery_image_upload_image_repo_impl.dart';
import 'package:zonka_feedback/feedback/data/repositories/survey_feedback_repo_impl.dart';
import 'package:zonka_feedback/feedback/data/repositories/survey_submit_repo_impl.dart';
import 'package:zonka_feedback/feedback/domain/repositories/auto_suggest_repo.dart';
import 'package:zonka_feedback/feedback/domain/repositories/selected_language_repo.dart';
import 'package:zonka_feedback/feedback/domain/repositories/survey_feedback_repo.dart';
import 'package:zonka_feedback/feedback/domain/repositories/survey_image_upload_feedback_repo.dart';
import 'package:zonka_feedback/feedback/domain/repositories/survey_submit_repo.dart';
import 'package:zonka_feedback/feedback/domain/usecase/auto_suggest_uc.dart';
import 'package:zonka_feedback/feedback/domain/usecase/selected_language_uc.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_feedback_uc.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_image_upload_uc.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_submit_uc.dart';
import 'package:zonka_feedback/location/data/data_source/location_ds.dart';
import 'package:zonka_feedback/dashboard/data/data_source/network_ds/workspace_ds.dart';
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
import 'package:zonka_feedback/setting/data/data_source/country_code_ds.dart';
import 'package:zonka_feedback/setting/data/repo_impl/country_code_repo_impl.dart';
import 'package:zonka_feedback/setting/domain/repo/country_code_repo.dart';
import 'package:zonka_feedback/setting/domain/usecase/country_code_uc.dart';
import 'package:zonka_feedback/surveys/data/data_source/local_ds/survey_local_ds.dart';
import 'package:zonka_feedback/surveys/data/data_source/network_ds/survey_ds.dart';
import 'package:zonka_feedback/surveys/data/repositories_impl/survey_repo_impl.dart';
import 'package:zonka_feedback/surveys/domain/repositories/survey_repo.dart';
import 'package:zonka_feedback/surveys/domain/usecase/survey_uc.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_time_unsync_controller.dart';
import 'package:zonka_feedback/template/data/data_source/local_ds/get_local_template_ds.dart';
import 'package:zonka_feedback/template/data/data_source/network_ds/add_template_ds.dart';
import 'package:zonka_feedback/template/data/data_source/network_ds/apply_template_ds.dart';
import 'package:zonka_feedback/template/data/data_source/network_ds/get_template_ds.dart';
import 'package:zonka_feedback/template/data/repo_impl/add_template_repo_impl.dart';
import 'package:zonka_feedback/template/data/repo_impl/apply_template_repo_impl.dart';
import 'package:zonka_feedback/template/data/repo_impl/get_template_repo_impl.dart';
import 'package:zonka_feedback/template/domain/repositories/add_template_repo.dart';
import 'package:zonka_feedback/template/domain/repositories/apply_template_repo.dart';
import 'package:zonka_feedback/template/domain/repositories/get_template_repo.dart';
import 'package:zonka_feedback/template/domain/usecase/add_template_uc.dart';
import 'package:zonka_feedback/template/domain/usecase/apply_template_uc.dart';
import 'package:zonka_feedback/template/domain/usecase/get_template_uc.dart';

import '../../feedback/presentation/manager/survery_api_feedback_controller.dart';
import '../../template/presentation/manager/add_template_manager.dart';
import '../../template/presentation/manager/apply_template_manager.dart';

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
    getIt.registerLazySingleton(() => SurveySubmitUc(surveySubmitRepo:getIt()));
    getIt.registerLazySingleton(() => GetTemplateUc(getAllTemplateRepo:getIt()));
    getIt.registerLazySingleton(() => ApplyTemplateUc(applyTemplateRepo:getIt()));
    getIt.registerLazySingleton(() => AddTemplateUc(addTemplateRepo:getIt()));
    getIt.registerLazySingleton(() => CountryCodeUc(countryCodeRepo:getIt()));
    getIt.registerLazySingleton(() => AutoSuggestUc(autoSuggestRepo:getIt()));
    getIt.registerLazySingleton(() => UpdateSurveyUc(updateSurveyRepo:getIt()));
    // getIt.registerLazySingleton(() => SurveyLanguagesUc(surveyFeedbackRepo:getIt())); 


    //Repository
    getIt.registerLazySingleton<LoginFeatureRepo>(() => LoginRepoImpl(loginDataSource: getIt()));
    getIt.registerLazySingleton<LocationRepo>(() => LocationRepoImpl(locationDataSource: getIt()));
    getIt.registerLazySingleton<WorkspaceRepo>(() => WorkspaceRepoImpl(workspaceDataSource: getIt(), workspaceLocalDs: getIt()));
    getIt.registerLazySingleton<SurveyRepository>(() => SurveyRepoImpl(surveyDataSource: getIt(), surveyLocalDs: getIt()));
    getIt.registerLazySingleton<SurveyFeedbackRepo>(() => SurveyFeedbackRepoImpl(surveyFeedBackDataSource: getIt() , submitSurveyLocalDs:getIt()));
    getIt.registerLazySingleton<ImageUploadFeedRepo>(() => SurveryImageUploadImageRepoImpl(surveyImageUploadDs: getIt()));
    getIt.registerLazySingleton<SelectedLanguageRepo>(() => SelectedLanguageRepoImpl(selectedLanguagaDs: getIt(), selectedLocalLanguageDs: getIt()));
    getIt.registerLazySingleton<SurveySubmitRepo>(() => SurveySubmitRepoImpl(submitSurveyDs: getIt()));
    getIt.registerLazySingleton<GetAllTemplateRepo>(() => GetAllTemplateRepoImpl(getAllTemplateDs: getIt(), getLocalTemplateDs: getIt()));
    getIt.registerLazySingleton<ApplyTemplateRepo>(()=>ApplyTemplateRepoImpl(applyTemplateDs: getIt()));
    getIt.registerLazySingleton<AddTemplateRepo>(()=>AddTemplateRepoImpl(addTemplateDs: getIt()));
    getIt.registerLazySingleton<CountryCodeRepo>(()=>CountryCodeRepoImpl(countryCodeDs: getIt()));
    getIt.registerLazySingleton<AutoSuggestRepo>(()=>AutoSuggestRepoImpl(autoSuggestDs: getIt()));
    getIt.registerLazySingleton<UpdateSurveyRepo>(()=>UpdateSurveyRepoImpl(updateSurveyDs: getIt()));
    


    //Data Source
    getIt.registerLazySingleton(() => LoginUserDs());
    getIt.registerLazySingleton(() => LocationDataSource());
    getIt.registerLazySingleton(() => WorkspaceDataSource());
    getIt.registerLazySingleton(() => SurveyDataSource());
    getIt.registerLazySingleton(() => SurveyFeedBackDataSource());
    getIt.registerLazySingleton(() => SurveyImageUploadDs());
    getIt.registerLazySingleton(() => SelectedLanguagaDs());
    getIt.registerLazySingleton(() => SurveySubmitDs());
    getIt.registerLazySingleton(() => GetAllTemplateDs());
    getIt.registerLazySingleton(() => ApplyTemplateDs());
    getIt.registerLazySingleton(() => AddTemplateDs());
    getIt.registerLazySingleton(() => CountryCodeDs());
    getIt.registerLazySingleton(() => SurveyFeedBackLocalDataSource());
    getIt.registerLazySingleton(() => SurveyLocalDs()); 
    getIt.registerLazySingleton(() => WorkspaceLocalDs());
    getIt.registerLazySingleton(() => SelectedLocalLanguageDs()); 
    getIt.registerLazySingleton(() => GetLocalTemplateDs()); 
    getIt.registerLazySingleton(() => AutoSuggestDs());
    getIt.registerLazySingleton(() => UpdateSurveyDs());  

    //Services
    getIt.registerLazySingleton(() => LoggerService());

    


    //init controllers 
    Get.lazyPut(() => SurveyTimeUnsyncController());
    Get.lazyPut(() => ApplyTemplateManagerController());
    Get.lazyPut(() => AddTemplateManagerController());
    Get.lazyPut(() => SurveryApiFeedbackController());

}