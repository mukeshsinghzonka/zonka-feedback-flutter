import 'package:zonka_feedback/services/network/api_result.dart';

abstract class ApplyTemplateRepo {
  Future<ApiResult<void>> applySurveyTemplates();
}
