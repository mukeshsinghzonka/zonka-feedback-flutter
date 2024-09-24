import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:zonka_feedback/bottomnavigation/data/data_model/udpate_survey_res_model.dart';
import 'package:zonka_feedback/bottomnavigation/data/data_model/update_survey_model.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/services/workmanager_functions/work_manager_service.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

class UpdateSurveyDs {
  final HttpUtil _httpUtil = HttpUtil();

  String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
    return formatter.format(dateTime);
  }

  Future<ApiResult<List<UpdateSurveyResModel>>> getUpdateSurveyDs() async {
    try {
      List<UpdateSurveyModel> updatedSurveyModel = [];
      Box? box = await HiveService().openBox(HiveDirectoryUtil.updateHiveSurveyId);
      List<dynamic> value = box!.keys.toList();
      for (int i = 0; i < value.length; i++) {
        String surveyId = value[i];
        DateTime modifiedDateValue = await HiveService().getData(HiveDirectoryUtil.updateHiveSurveyId, surveyId);
        updatedSurveyModel.add(UpdateSurveyModel(modifiedDate: modifiedDateValue, surveyId: surveyId));
      }
      final response = await _httpUtil.post(
        '/api/v1/surveys/checkSurveyUpdate',
        data: {
          "list": updatedSurveyModel
              .map((survey) => {
                    "surveyId": survey.surveyId,
                    "modifiedDate": formatDateTime(survey.modifiedDate!),
                  })
              .toList(),
        },
      );

      List<UpdateSurveyResModel> updateResModelList = [];
      for(var valueData in response['data'] ){
            updateResModelList.add(UpdateSurveyResModel.fromJson(valueData));
      }
      print("udpateresmodelvalue ${updateResModelList}");
      HiveService().putData(HiveDirectoryUtil.updateHiveSurveyId, HiveKey.updateSurveyKey, updateResModelList);
      WorkManagerService().downloadUpdateAllSurveyTask();
      return ApiResult.success(data: updateResModelList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
