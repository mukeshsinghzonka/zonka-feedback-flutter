import 'package:zonka_feedback/feedback/data/data_source/network_ds/survey_image_upload_ds.dart';
import 'package:zonka_feedback/feedback/domain/repositories/survey_image_upload_feedback_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

class SurveryImageUploadImageRepoImpl extends ImageUploadFeedRepo{
  final SurveyImageUploadDs surveyImageUploadDs;
  SurveryImageUploadImageRepoImpl({required this.surveyImageUploadDs});
  @override
  Future<ApiResult<String>> imageUploadFeedRepo({required String ? filePath, required String ? fileName,  required String referenceCode}) async {
    return await surveyImageUploadDs.uploadImageUploadDs(fileName: fileName, filePath: filePath, referenceCode: referenceCode);
  }
}