
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/template/data/data_model/add_template_model.dart';

abstract class AddTemplateRepo{
   Future<ApiResult<AddTemplateModel>> addTemplatesRepo();
}