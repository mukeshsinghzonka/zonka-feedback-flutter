

import 'package:zonka_feedback/feedback/data/data_model_new/language_model.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

class SelectedLocalLanguageDs {


    Future<ApiResult<List<LanguageModel>>> getSurveyLanguageLocalDs ()async {
        try{
            var value =  await HiveService().getData(HiveDirectoryUtil.languageModelBox, HiveKey.languageSurveyKey);
            List<LanguageModel> languageList  = [];
            if(value!=null){
              languageList = List<LanguageModel>.from(value);
            }
            return ApiResult.success(data:languageList);
        }
        catch(e){
            return ApiResult.failure(error: NetworkExceptions.getDioException(e));
        }


    }
}