import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/template/data/data_model/template_mapping_model.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

class GetLocalTemplateDs {
  Future<ApiResult<TemplateData>> getAllLocalTemplateDs() async {
    try {
      var value = await HiveService().getData(
          HiveDirectoryUtil.templateModelBox, HiveKey.templateSurveyKey);
      TemplateData? templateData;
      if (value != null && value is TemplateData) {
        templateData = value;
      } else {
        // Handle the case where value is null or not of type TemplateData
        print("No TemplateData found or value is of incorrect type.");
      }
      return ApiResult.success(data: templateData);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
