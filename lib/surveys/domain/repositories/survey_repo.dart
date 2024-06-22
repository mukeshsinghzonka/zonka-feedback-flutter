
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_req_model.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_res_model.dart';

abstract class SurveyRepository {
  Future<ApiResult<List<SurveyResModel>>> getSurveys({required  List<SurveyReqModel> params});
}