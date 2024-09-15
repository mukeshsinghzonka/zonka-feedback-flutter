
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_res_model.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_req_model.dart';
import 'package:zonka_feedback/surveys/data/data_source/network_ds/survey_ds.dart';
import 'package:zonka_feedback/surveys/domain/repositories/survey_repo.dart';

class SurveyRepoImpl extends SurveyRepository{

  final SurveyDataSource surveyDataSource;

  SurveyRepoImpl({required this.surveyDataSource});

  @override
  Future<ApiResult<List<SurveyResModel>>> getSurveys({required  List<SurveyReqModel> params}) async {
    return await surveyDataSource.getSurveysDs(params: params);
  }
  
}