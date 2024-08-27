import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/template/data/data_model/template_industries_map.dart';
import 'package:zonka_feedback/template/data/data_model/template_mapping_model.dart';
import 'package:zonka_feedback/template/data/data_model/template_model.dart';

class  GetAllTemplateDs {

  final HttpUtil _httpUtil = HttpUtil();
  Future<ApiResult<TemplateData>> getAllTemplateDs() async {
    try { 
      final response = await _httpUtil.get('/api/v1/surveys/templates');
      List templateMapping = response['data']['surveyTemplatesMap'];
      List templateIndustriesMapping = response['data']['templateIndustriesMap'];

      List<TemplateModel> templateModelList = templateMapping.map((value)=>TemplateModel.fromJson(value)).toList();
      List<TemplateIndustriesMap> templateIndustriesMap = templateIndustriesMapping.map((value)=>TemplateIndustriesMap.fromJson(value)).toList();
  
      TemplateData templateData = TemplateData(
        templateModelList: templateModelList,
        templateIndustriesMap: templateIndustriesMap,
      );
      
      return ApiResult.success(data: templateData);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

}