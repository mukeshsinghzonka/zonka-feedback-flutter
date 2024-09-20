import 'package:zonka_feedback/feedback/data/data_model_new/language_model.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';


class SelectedLanguagaDs {

  final HttpUtil _httpUtil = HttpUtil();

  Future<ApiResult<List<LanguageModel>>> getSelectedLanguageDs() async {
    try{
      final responseSurvey = await _httpUtil.get('/api/v1/surveys/languages'); 
      List<LanguageModel> languageReponse = [];
      for(int i = 0;i<responseSurvey['data']['languagesMap'].length ;i++){
        languageReponse.add(LanguageModel.fromJson(responseSurvey['data']['languagesMap'][i]));
      }
      await HiveService().putData(HiveDirectoryUtil.languageModelBox, HiveKey.languageSurveyKey, languageReponse);
      return ApiResult.success(data: languageReponse);
    }
    catch(e){
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }   
  }

}