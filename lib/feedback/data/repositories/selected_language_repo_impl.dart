

import 'package:zonka_feedback/feedback/data/data_model_new/language_model.dart';
import 'package:zonka_feedback/feedback/data/data_source/selected_languaga_ds.dart';
import 'package:zonka_feedback/feedback/domain/repositories/selected_language_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

class SelectedLanguageRepoImpl extends SelectedLanguageRepo {
  final SelectedLanguagaDs selectedLanguagaDs;
  SelectedLanguageRepoImpl({required this.selectedLanguagaDs});

  @override
  Future<ApiResult<List<LanguageModel>>> surveySelectedLanguageRepo() async  {
    return await selectedLanguagaDs.getSelectedLanguageDs();
  }}