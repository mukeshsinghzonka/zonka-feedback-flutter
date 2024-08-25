

import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';
import 'package:zonka_feedback/template/domain/repositories/get_template_repo.dart';

class GetTemplateUc extends UseCaseNoParams<ApiResult<void>>{

  final GetAllTemplateRepo getAllTemplateRepo;
  GetTemplateUc({required this.getAllTemplateRepo});

  @override
  Future<ApiResult<void>> call() async {
    return await getAllTemplateRepo.getAllSurveyTemplates();
  }

}