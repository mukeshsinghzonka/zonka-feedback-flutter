

import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/template/data/data_source/apply_template_ds.dart';
import 'package:zonka_feedback/template/domain/repositories/apply_template_repo.dart';

class ApplyTemplateRepoImpl extends ApplyTemplateRepo{

  final  ApplyTemplateDs applyTemplateDs;
  ApplyTemplateRepoImpl({required this.applyTemplateDs});

  @override
  Future<ApiResult<void>> applySurveyTemplates() async {
      return await applyTemplateDs.applyTemplateDs();
  }

}