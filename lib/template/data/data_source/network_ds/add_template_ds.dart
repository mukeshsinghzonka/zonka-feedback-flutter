
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/template/data/data_model/add_template_model.dart';
import 'package:zonka_feedback/template/data/data_model/add_template_params.dart';

class AddTemplateDs {
 final HttpUtil _httpUtil = HttpUtil();
 Future<ApiResult<AddTemplateModel>> addTemplateDs({required AddTemplateParams addtemplateParams}) async {
    try {
      final response = await _httpUtil.post('/api/v1/surveys/add',
      data: addtemplateParams.toJson()
      );
      AddTemplateModel value = AddTemplateModel.fromJson(response['data']);
      return ApiResult.success(data: value);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}