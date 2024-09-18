
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_connectivity.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_res_model.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_req_model.dart';
import 'package:zonka_feedback/surveys/data/data_source/local_ds/survey_local_ds.dart';
import 'package:zonka_feedback/surveys/data/data_source/network_ds/survey_ds.dart';
import 'package:zonka_feedback/surveys/domain/repositories/survey_repo.dart';

class SurveyRepoImpl extends SurveyRepository{

  final SurveyDataSource surveyDataSource;
  final SurveyLocalDs surveyLocalDs;
  NetworkConnectivity networkConnectivity = NetworkConnectivity();
  SurveyRepoImpl({required this.surveyDataSource, required this.surveyLocalDs});

  @override
  Future<ApiResult<List<SurveyResModel>>> getSurveys({required  List<SurveyReqModel> params}) async {
    bool checkInternet = await networkConnectivity.isConnected();
    print("surveyresmodel $checkInternet");
    if (checkInternet) {
      return await surveyDataSource.getSurveysDs(params: params);
    }
    else{
      return await surveyLocalDs.getSurveysLocalDs();
    }
  }
  
}