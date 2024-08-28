import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/template/data/data_model/apply_template_params.dart';

abstract class ApplyTemplateRepo {
  Future<ApiResult<void>> applySurveyTemplates({required ApplyTemplateParams applyTemplate});
}
