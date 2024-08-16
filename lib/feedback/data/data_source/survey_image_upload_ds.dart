
import 'package:dio/dio.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';

class SurveyImageUploadDs{

    final HttpUtil _httpUtil = HttpUtil();
  
    Future<ApiResult<String>> uploadImageUploadDs({required String ? filePath, required String ? fileName, required String referenceCode, }) async {
    try {   
      final responseSurvey = await _httpUtil.postUpload('/api/v1/surveys/saveCameraCapture/$referenceCode',
      data:FormData.fromMap({
        'webcam': await MultipartFile.fromFile(
          filePath??'',
          filename: fileName,
        )
      }));
      return  ApiResult.success(data:responseSurvey['data']['imageUrl']);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

}