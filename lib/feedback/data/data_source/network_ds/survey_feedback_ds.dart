import 'package:zonka_feedback/feedback/data/data_model_new/survey_model.dart';
import 'package:zonka_feedback/feedback/data/data_source/local_ds/survey_feedback_local_ds.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';

import '../../data_model_new/survey_data_model.dart';
class SurveyFeedBackDataSource {
  final HttpUtil _httpUtil = HttpUtil();
  final SurveyFeedBackLocalDataSource surveyFeedBackDataSource = SurveyFeedBackLocalDataSource();
  Future<ApiResult<SurveyDataModel>> getSurveyFeedBackDs({required String? suveryId}) async {
    try {
      final responseSurvey = await _httpUtil.get('/api/v1/surveys/download/$suveryId');
      print("surveyreponsedata ${responseSurvey['data']['servers']}");
      SurveyDataModel surveyFeedBackModel = SurveyDataModel.fromJson(responseSurvey['data']);
      HiveService().putData(HiveDirectoryUtil.surveyDownloadResponseBox, suveryId??"", surveyFeedBackModel);
      HiveService().putData(HiveDirectoryUtil.updateHiveSurveyId,suveryId??"",DateTime.now().toUtc());
      return ApiResult.success(data:surveyFeedBackModel);
    } catch (e) {
      await surveyFeedBackDataSource.getSurveyFeedBackLocalDs(suveryId: suveryId);
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  
}
