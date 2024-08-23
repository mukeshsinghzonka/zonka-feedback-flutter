import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_submit_model.dart';
import 'package:zonka_feedback/feedback/domain/repositories/survey_submit_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';

class SurveySubmitUc extends UseCase<ApiResult<void> , SurveySubmitModel>{

 final SurveySubmitRepo surveySubmitRepo;
 SurveySubmitUc({required this.surveySubmitRepo});

  @override
  Future<ApiResult<void>> call(SurveySubmitModel params)async  {
    
     final response = await surveySubmitRepo.surveySubmitRepo(suverySubmitModel: params);
     return response;

  }
  
}
