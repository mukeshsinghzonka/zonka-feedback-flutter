
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/template/data/data_model/add_template_model.dart';
import 'package:zonka_feedback/template/data/data_model/add_template_params.dart';
import 'package:zonka_feedback/template/data/data_source/network_ds/add_template_ds.dart';
import 'package:zonka_feedback/template/domain/repositories/add_template_repo.dart';

class AddTemplateRepoImpl extends AddTemplateRepo{
  final AddTemplateDs addTemplateDs;
  AddTemplateRepoImpl({required this.addTemplateDs});

  @override
  Future<ApiResult<AddTemplateModel>> addTemplatesRepo({required AddTemplateParams addtemplateParams})async {
   return await addTemplateDs.addTemplateDs(
    addtemplateParams: addtemplateParams
   );
  }
  
}