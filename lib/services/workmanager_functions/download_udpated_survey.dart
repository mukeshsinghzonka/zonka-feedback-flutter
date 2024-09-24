import 'package:zonka_feedback/bottomnavigation/data/data_model/udpate_survey_res_model.dart';
import 'package:zonka_feedback/bottomnavigation/data/data_model/update_survey_model.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_feedback_uc.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

Future<void> downloadUpdatedAllSurvey() async {
  await HiveService().init();
  setup();
  try {
    List<UpdateSurveyResModel> updateResSurveyModel = await HiveService().getData(HiveDirectoryUtil.updateHiveSurveyId, HiveKey.updateSurveyKey);
    for (int i = 0; i < updateResSurveyModel.length; i++) {
      if(updateResSurveyModel[i].updatesAvailable){
         await getIt.get<SurveyFeedbackUc>().call(updateResSurveyModel[i].surveyId);
      }
      else if(updateResSurveyModel[i].isDeleted){
         await HiveService().deleteData(HiveDirectoryUtil.surveyDownloadResponseBox, updateResSurveyModel[i].surveyId);
      }
    }
  } catch (e) {
    print("Error processing survey");
  }
}
