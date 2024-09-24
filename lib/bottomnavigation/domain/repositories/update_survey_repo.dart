import 'package:zonka_feedback/bottomnavigation/data/data_model/udpate_survey_res_model.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

abstract class UpdateSurveyRepo {
    Future<ApiResult<List<UpdateSurveyResModel>>> getUpdateSurveyRepo();
}