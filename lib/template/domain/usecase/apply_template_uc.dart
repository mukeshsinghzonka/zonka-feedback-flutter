import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';
import 'package:zonka_feedback/template/data/data_model/apply_template_params.dart';
import 'package:zonka_feedback/template/domain/repositories/apply_template_repo.dart';

class ApplyTemplateUc extends UseCase<ApiResult<void>,ApplyTemplateParams>{

  final ApplyTemplateRepo applyTemplateRepo;
  ApplyTemplateUc({required this.applyTemplateRepo});
  
  @override
  Future<ApiResult<void>> call(ApplyTemplateParams params) async {
  return await applyTemplateRepo.applySurveyTemplates(
    applyTemplate: params
  );
  }


}


