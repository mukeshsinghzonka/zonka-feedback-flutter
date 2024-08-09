
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';

class SurveyImageUploadDs{

    final HttpUtil _httpUtil = HttpUtil();
  
    Future<ApiResult<String>> uploadImageUploadDs({required String ? filePath, required String ? fileName, required String referenceCode, }) async {
    try {
      print("uploadImageUploadDs");
      final responseSurvey = await _httpUtil.postUpload('/api/v1/surveys/saveCameraCapture/$referenceCode',
     
      data: FormData(
      {
        'webcam':MultipartFile(
          filePath,
          filename: fileName??"",

        ),
      }
      )
      
      );

      print(responseSurvey);
      return const ApiResult.success(data:"vldfnlkf");
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

}