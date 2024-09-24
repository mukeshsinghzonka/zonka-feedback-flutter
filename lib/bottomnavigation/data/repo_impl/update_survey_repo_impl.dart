import 'package:zonka_feedback/bottomnavigation/data/data_model/udpate_survey_res_model.dart';
import 'package:zonka_feedback/bottomnavigation/data/data_source/update_survey_ds.dart';
import 'package:zonka_feedback/bottomnavigation/domain/repositories/update_survey_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

class UpdateSurveyRepoImpl extends UpdateSurveyRepo {
  final UpdateSurveyDs updateSurveyDs;
  UpdateSurveyRepoImpl({required this.updateSurveyDs});
  @override
  Future<ApiResult<List<UpdateSurveyResModel>>> getUpdateSurveyRepo() async {
    return await updateSurveyDs.getUpdateSurveyDs();
  }
}
