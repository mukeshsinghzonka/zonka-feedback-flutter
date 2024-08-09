import 'package:zonka_feedback/services/network/api_result.dart';

abstract class ImageUploadFeedRepo {
  Future<ApiResult<String>> imageUploadFeedRepo({required String? fileName, required String ? filePath, required String referenceCode});
}