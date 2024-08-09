import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:zonka_feedback/feedback/domain/repositories/survey_image_upload_feedback_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';

class SurveyImageUploadUc extends UseCase<ApiResult<String> ,SurveyImageUploadUcParams> {
  final ImageUploadFeedRepo imageUploadFeedRepo;
  SurveyImageUploadUc({required  this.imageUploadFeedRepo});
  @override
  Future<ApiResult<String>> call(SurveyImageUploadUcParams params) async {
    return await imageUploadFeedRepo.imageUploadFeedRepo(fileName: params.fileName,filePath: params.filePath, referenceCode: params.referenceCode);
  }
}

class SurveyImageUploadUcParams extends Equatable {
final String fileName;
final String filePath;
  final String referenceCode;
  const SurveyImageUploadUcParams({ required this.fileName, required this.filePath, required this.referenceCode});
  
  @override
  List<Object?> get props => [
    fileName,
    filePath,
    referenceCode
  ];
}