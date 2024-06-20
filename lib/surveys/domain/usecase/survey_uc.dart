
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_res_model.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_req_model.dart';
import 'package:zonka_feedback/surveys/domain/repositories/survey_repo.dart';

class SurveyUseCase extends UseCase<ApiResult<List<SurveyResModel>>,  List<SurveyReqModel>> {
  final SurveyRepository surveyRepository;
  SurveyUseCase({required this.surveyRepository});

  @override
  Future<ApiResult<List<SurveyResModel>>> call( List<SurveyReqModel> params) async {
    return await surveyRepository.getSurveys(params: params);
  }
}