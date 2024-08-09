import 'package:zonka_feedback/feedback/data/data_model_new/survey_model.dart';
import 'package:zonka_feedback/feedback/data/data_source/survey_feedback_ds.dart';
import 'package:zonka_feedback/feedback/domain/repositories/survey_feedback_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

class SurveyFeedbackRepoImpl extends SurveyFeedbackRepo{

  final SurveyFeedBackDataSource surveyFeedBackDataSource;
  SurveyFeedbackRepoImpl({required this.surveyFeedBackDataSource});

  @override
  Future<ApiResult<SurveyModel>> surveyFeedbackRepo({required String? suveryId}) async {
    return await surveyFeedBackDataSource.getSurveyFeedBackDs(suveryId: suveryId);
  }

}