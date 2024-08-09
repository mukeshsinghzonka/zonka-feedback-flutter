import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_image_upload_uc.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class SurveyImageUploadManager extends BaseControllerWithParams<void, SurveyImageUploadUcParams> {

  
  late Rx<String> _imageUrl;
  Rx<String> get imageUrl => _imageUrl;
  void setImageUrl(String value) async {
    _imageUrl = Rx<String>(value);      
    update();
  } 

  @override
  Future<void> call(SurveyImageUploadUcParams params) async {
    setStatus(ApiCallStatus.Loading);
    ApiResult<String> response = await getIt.get<SurveyImageUploadUc>().call(params);
      response.when(success: (data)  {
      setStatus(ApiCallStatus.Success);
      setImageUrl(data!);
      return;
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  }
}
