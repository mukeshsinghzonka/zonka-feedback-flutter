import 'package:zonka_feedback/feedback/data/data_model_new/survey_model.dart';
import 'package:zonka_feedback/feedback/data/data_source/network_ds/survey_feedback_ds.dart';
import 'package:zonka_feedback/feedback/domain/repositories/survey_feedback_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_connectivity.dart';
import 'package:zonka_feedback/feedback/data/data_source/local_ds/survey_feedback_local_ds.dart';

class SurveyFeedbackRepoImpl extends SurveyFeedbackRepo {
  final SurveyFeedBackDataSource surveyFeedBackDataSource;
  final SurveyFeedBackLocalDataSource submitSurveyLocalDs;
  NetworkConnectivity networkConnectivity = NetworkConnectivity();
  SurveyFeedbackRepoImpl(
      {required this.surveyFeedBackDataSource,
      required this.submitSurveyLocalDs});

  @override
  Future<ApiResult<SurveyModel>> surveyFeedbackRepo({required String? suveryId}) async {
    bool checkInternet = await networkConnectivity.isConnected();
    if (checkInternet) {
      return await surveyFeedBackDataSource.getSurveyFeedBackDs(suveryId: suveryId);
    } else {
      return await submitSurveyLocalDs.getSurveyFeedBackLocalDs(suveryId: suveryId);
    }
  }
}
