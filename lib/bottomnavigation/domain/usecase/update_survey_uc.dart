import 'package:zonka_feedback/bottomnavigation/data/data_model/udpate_survey_res_model.dart';
import 'package:zonka_feedback/bottomnavigation/domain/repositories/update_survey_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';

class UpdateSurveyUc extends UseCaseNoParams<ApiResult<List<UpdateSurveyResModel>>> {
  final UpdateSurveyRepo updateSurveyRepo;
  UpdateSurveyUc({required this.updateSurveyRepo});

  @override
  Future<ApiResult<List<UpdateSurveyResModel>>> call() async {
    return await updateSurveyRepo.getUpdateSurveyRepo();
  }
}
