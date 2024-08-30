

import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';
import 'package:zonka_feedback/template/data/data_model/add_template_model.dart';
import 'package:zonka_feedback/template/data/data_model/add_template_params.dart';
import 'package:zonka_feedback/template/domain/repositories/add_template_repo.dart';

class AddTemplateUc extends UseCase<ApiResult<AddTemplateModel>, AddTemplateParams>{

  final AddTemplateRepo addTemplateRepo;
  AddTemplateUc({required this.addTemplateRepo});
  
  @override
  Future<ApiResult<AddTemplateModel>> call(AddTemplateParams params) async {
    return await addTemplateRepo.addTemplatesRepo(
      addtemplateParams: params
    );
  }
  
}