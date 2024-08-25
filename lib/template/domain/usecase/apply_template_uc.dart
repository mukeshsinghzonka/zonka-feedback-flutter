import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';
import 'package:zonka_feedback/template/domain/repositories/apply_template_repo.dart';

class ApplyTemplateUc extends UseCaseNoParams<ApiResult<void>>{

  final ApplyTemplateRepo applyTemplateRepo;
  ApplyTemplateUc({required this.applyTemplateRepo});


  @override
  Future<ApiResult<void>> call() async {
   return await applyTemplateRepo.applySurveyTemplates();
  }

}