

import 'package:zonka_feedback/feedback/data/data_model_new/language_model.dart';
import 'package:zonka_feedback/feedback/data/data_source/local_ds/selected_local_language_ds.dart';
import 'package:zonka_feedback/feedback/data/data_source/network_ds/selected_languaga_ds.dart';
import 'package:zonka_feedback/feedback/domain/repositories/selected_language_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_connectivity.dart';

class SelectedLanguageRepoImpl extends SelectedLanguageRepo {
  final SelectedLanguagaDs selectedLanguagaDs;
  final SelectedLocalLanguageDs selectedLocalLanguageDs;
  NetworkConnectivity networkConnectivity = NetworkConnectivity();
  SelectedLanguageRepoImpl({required this.selectedLanguagaDs, required this.selectedLocalLanguageDs});

  @override
  Future<ApiResult<List<LanguageModel>>> surveySelectedLanguageRepo(String value) async  {
    bool isConnected = await networkConnectivity.isConnected();
    if(isConnected && value == 'Remote'){
      return await selectedLanguagaDs.getSelectedLanguageDs();
    }
    else{
      return await selectedLocalLanguageDs.getSurveyLanguageLocalDs();
    }
   
}}