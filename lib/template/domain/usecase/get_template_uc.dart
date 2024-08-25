

import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';
import 'package:zonka_feedback/template/data/data_model/template_model.dart';
import 'package:zonka_feedback/template/domain/repositories/get_template_repo.dart';

class GetTemplateUc extends UseCaseNoParams<ApiResult<List<TemplateModel>>>{

  final GetAllTemplateRepo getAllTemplateRepo;
  GetTemplateUc({required this.getAllTemplateRepo});

  @override
  Future<ApiResult<List<TemplateModel>>> call() async {
    return await getAllTemplateRepo.getAllSurveyTemplates();
  }

}