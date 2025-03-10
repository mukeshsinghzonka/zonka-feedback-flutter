import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/template/data/data_model/template_mapping_model.dart';

abstract class GetAllTemplateRepo {
  Future<ApiResult<TemplateData>> getAllSurveyTemplates();
}