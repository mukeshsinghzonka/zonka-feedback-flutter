
import 'package:zonka_feedback/feedback/data/data_model_new/language_model.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

abstract class SelectedLanguageRepo {
   Future<ApiResult<List<LanguageModel>>> surveySelectedLanguageRepo(String value);
}