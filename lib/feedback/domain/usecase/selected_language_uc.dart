import 'package:zonka_feedback/feedback/data/data_model_new/language_model.dart';
import 'package:zonka_feedback/feedback/domain/repositories/selected_language_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';

class SelectedLanguageUc extends UseCase<ApiResult<List<LanguageModel>>, String >{

  final SelectedLanguageRepo selectedLanguageRepo;
  SelectedLanguageUc({required this.selectedLanguageRepo});

  @override
  Future<ApiResult<List<LanguageModel>>> call(String params) {
    return selectedLanguageRepo.surveySelectedLanguageRepo(params);
  }

}