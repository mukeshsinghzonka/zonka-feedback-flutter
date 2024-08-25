import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/template/data/data_model/template_model.dart';

class  GetAllTemplateDs {

  final HttpUtil _httpUtil = HttpUtil();
  Future<ApiResult<List<TemplateModel>>> getAllTemplateDs() async {
    try { 
      final response = await _httpUtil.get('/api/v1/surveys/templates');
      List templateMapping = response['data']['surveyTemplatesMap'];
      List<TemplateModel> templateModelList = templateMapping.map((value)=>TemplateModel.fromJson(value)).toList();
      return ApiResult.success(data: templateModelList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

}