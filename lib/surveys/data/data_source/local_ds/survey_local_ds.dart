

import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_res_model.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

class SurveyLocalDs {
   Future<ApiResult<List<SurveyResModel>>> getSurveysLocalDs() async {
    try {
       print("surveyresmodel");
       
      var surveyList =  await HiveService().getData(HiveDirectoryUtil.surveyResModelBox, HiveKey.surveyResKey);
   
    List<SurveyResModel> surveyResModelList =[];

    if (surveyList != null) {
  // Assuming 'surveyList' is a List<dynamic> that contains maps or json strings

  surveyResModelList = List<SurveyResModel>.from(surveyList);
  // Use surveyResModelList here
}

    print("surveyresmodel $surveyList");
      return ApiResult.success(data: surveyResModelList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}