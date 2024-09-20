

import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/template/data/data_model/apply_template_params.dart';
import 'package:zonka_feedback/template/data/data_source/network_ds/apply_template_ds.dart';
import 'package:zonka_feedback/template/domain/repositories/apply_template_repo.dart';

class ApplyTemplateRepoImpl extends ApplyTemplateRepo{

  final  ApplyTemplateDs applyTemplateDs;
  ApplyTemplateRepoImpl({required this.applyTemplateDs});

  @override
  Future<ApiResult<void>> applySurveyTemplates({required ApplyTemplateParams applyTemplate}) async {
      return await applyTemplateDs.applyTemplateDs(
        applyTemplate: applyTemplate
      );
  }

}