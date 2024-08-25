

import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/template/data/data_source/get_template_ds.dart';
import 'package:zonka_feedback/template/domain/repositories/get_template_repo.dart';

class GetAllTemplateRepoImpl extends GetAllTemplateRepo{

  final GetAllTemplateDs getAllTemplateDs;
  GetAllTemplateRepoImpl({required this.getAllTemplateDs});

  @override
  Future<ApiResult<void>> getAllSurveyTemplates() { 
    return getAllTemplateDs.getAllTemplateDs();
  }

}