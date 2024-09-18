

import 'package:zonka_feedback/feedback/data/data_model_new/survey_model.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';

class SurveyFeedBackLocalDataSource {


  Future<ApiResult<SurveyModel>> getSurveyFeedBackLocalDs({required String? suveryId})async {
       try {
        var value =  await HiveService().getData(HiveDirectoryUtil.surveyDownloadResponseBox, suveryId??"");
       print("localsurveyvalue $value");

      SurveyModel? surveyModel;

      if (value != null) {
        // Assuming 'value' is already an instance of SurveyModel, no need to deserialize
        surveyModel = value as SurveyModel;
      }
if(surveyModel  == null){
       return const ApiResult.failure(error: NetworkExceptions.notFound("Data is not saved in local"));
}
        return ApiResult.success(data:surveyModel);
       }
       catch(e){
          return ApiResult.failure(error: NetworkExceptions.getDioException(e));
       }

  }
}
